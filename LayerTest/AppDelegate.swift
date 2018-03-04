//
//  AppDelegate.swift
//  LayerTest
//
//  Created by pike young on 2018/2/24.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var tabBarController: UITabBarController?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // test8_3_2
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let viewController1 = FirstViewController()
//        let viewController2 = SecondViewController()
//        tabBarController = UITabBarController()
//        tabBarController?.viewControllers = [viewController1, viewController2]
//        tabBarController?.delegate = self
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
        return true
    }
}

// test8_3_2
//extension AppDelegate: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        //set up crossfade transition
//        let transition = CATransition()
//        transition.type = kCATransitionFade
//        //apply transition to tab bar controller's view
//        tabBarController.view.layer.add(transition, forKey: nil)
//    }
//}

