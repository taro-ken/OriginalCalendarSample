//
//  ViewController.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/03.
//

import UIKit

final class ViewController: UIViewController {
    
    static func makeFromStoryboard() -> ViewController {
            let vc = UIStoryboard.viewController
            return vc
        }
    
    private let CELL_NIB_NAME = "CollectionViewCell"
      private let CELL_ID = "CollectionViewCell"
    
    
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var calenderCollectionView: UICollectionView!{
        didSet {
            let cellNIB = UINib(nibName: CELL_NIB_NAME, bundle: nil)
            calenderCollectionView.register(cellNIB, forCellWithReuseIdentifier: CELL_ID)
            calenderCollectionView.dataSource = self
            calenderCollectionView.delegate = self
        }
    }
    
    private var model = CalendarDetailModel.init()
    private let dateManager = MonthDateManager()
   private let itemSize: CGFloat = (UIScreen.main.bounds.width - 60) / 7
    private let weeks = ["日","月", "火", "水", "木", "金", "土"]



    

    override func viewDidLoad() {
        super.viewDidLoad()
                self.navigationItem.title = dateManager.monthString
        collectionViewLayout.estimatedItemSize = .zero
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 3
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.itemSize = CGSize(width: itemSize, height: 200)
//        dateManager.createToday{ [weak self] result in
//                   switch result {
//                   case.failure(let error):
//                       print("error")
//                   case.success(let dt):
//                       print(dt)
//                   }
//               }
    }

    
    @IBAction func next(_ sender: Any) {
        dateManager.nextMonth()
                calenderCollectionView.reloadData()
                title = dateManager.monthString
    }
    

    
    @IBAction func back(_ sender: Any) {
        dateManager.prevMonth()
                calenderCollectionView.reloadData()
                title = dateManager.monthString
    
}
    
    @IBAction func tapAdd(_ sender: Any) {
        Router.shared.showAdd(from: self, model: model)
    }
    
    

}

extension ViewController:UICollectionViewDataSource {
    
    func numberOfSections(in calenderCollectionView: UICollectionView) -> Int {
            return 2
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? weeks.count : dateManager.days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = calenderCollectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as? CollectionViewCell else {
            return CollectionViewCell()
        }
        if indexPath.section == 0 {
                    let day = weeks[indexPath.row]
                    let model = Model.init(text: day, textColor: .black)
                    cell.layer.borderColor = UIColor.clear.cgColor
            
            
                    cell.configure(user: model)
                } else {
                    let date = dateManager.days[indexPath.row]
                    cell.layer.borderColor = UIColor.gray.cgColor
                    cell.layer.borderWidth = 0.5
                    cell.configure(user: Model.init(date: date))
                }
                dateManager.createToday{ [weak self] result in
                           switch result {
                           case.failure(let error):
                               print("error")
                           case.success(let dt):
                               if self?.dateManager.days[indexPath.row].string(format: "YYYY/MM/dd") == dt {
                                   cell.backgroundColor = .lightGray
                               }else{
                                   cell.backgroundColor = .clear
                               }
                           }
                       }
        let selectedBGView = UIView(frame: cell.frame)
            selectedBGView.backgroundColor = .blue
            cell.selectedBackgroundView = selectedBGView
                return cell
            }
}

extension ViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
                   return
               }
               title = dateManager.days[indexPath.row].string(format: "YYYY/MM/dd")
              model.day = dateManager.days[indexPath.row].string(format: "YYYY/MM/dd")
           }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: Int
        if indexPath.section == 0 {
            height = 50
        }else {
            height = 120
        }
        return CGSize(width: 55, height: height)
    }
}
