//
//  AddViewController.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/08.
//

import UIKit

final class AddViewController: UIViewController {
    
    static func makeFromStoryboard(model:CalendarDetailModel) -> AddViewController {
        let vc = UIStoryboard.addViewController
        vc.model = model
        return vc
    }
    
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    
    private var model = CalendarDetailModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayLabel.text = model.day
        print(model)
    }
    
    
}
