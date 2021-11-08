//
//  CollectionViewCell.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/03.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    
    func configure(user: Model) {
        titleLabel.text = user.text
        titleLabel.textColor = user.textColor
      }
}
