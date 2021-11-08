//
//  Ex.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/06.
//
import UIKit

extension UIColor {
    class var lightBlue: UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }

    class var lightRed: UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}


extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
