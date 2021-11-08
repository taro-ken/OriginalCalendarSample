//
//  Model.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/03.
//

import UIKit

struct Model{
    
    var text: String = ""
    var textColor: UIColor = .black
}

extension Model {

    init(date: Date) {
        let weekday = Calendar.current.component(.weekday, from: date)
        if weekday == 1 {
            textColor = .lightRed
        } else if weekday == 7 {
            textColor = .lightBlue
        } else {
            textColor = .gray
        }
        text = date.string(format: "d")
    }
}
