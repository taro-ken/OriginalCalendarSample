//
//  +Storyboard.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/08.
//

import UIKit

extension UIStoryboard {
    static var viewController: ViewController {
        UIStoryboard.init(name: "main", bundle: nil).instantiateInitialViewController() as! ViewController
    }

    static var addViewController: AddViewController {
        UIStoryboard.init(name: "Add", bundle: nil).instantiateInitialViewController() as! AddViewController
    }

    
}
