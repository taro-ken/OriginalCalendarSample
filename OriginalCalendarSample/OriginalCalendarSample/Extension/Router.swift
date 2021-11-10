//
//  Router.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/08.
//

import UIKit

final class Router {

    static let shared: Router = .init()
    private init() {}

//    private (set) var window: UIWindow?

    // 起動直後の画面を表示する
//    func showRoot(window: UIWindow?) {
//        // パラメータから初期画面を切り替える
//        if AuthFirebase.auth.currentUser !== nil,
//           AuthFirebase.auth.currentUser?.isEmailVerified == true {
//            let vc = WantTodoListViewController.makeFromStoryboard()
//            let nav = UINavigationController(rootViewController: vc)
//            window?.rootViewController = nav
//        } else {
//            let vc = SignInViewController.makeFromStoryboard()
//            let nav = UINavigationController(rootViewController: vc)
//            window?.rootViewController = nav
//            nav.setNavigationBarHidden(true, animated: true)
//        }
//        window?.makeKeyAndVisible()
//        self.window = window
//    }

    func showSginIn(from: UIViewController) {
        let vc = ViewController.makeFromStoryboard()
        show(from: from, next: vc)
    }

    func showAdd(from: UIViewController,model: CalendarDetailModel) {
        let vc = AddViewController.makeFromStoryboard(model: model)
        show(from: from, next: vc)
    }

}

private extension Router {
    func show(from: UIViewController, next: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(next, animated: animated)
        } else {
            from.present(next, animated: animated, completion: nil)
        }

    }

}
