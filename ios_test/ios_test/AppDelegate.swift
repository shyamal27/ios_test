//
//  AppDelegate.swift
//  ios_test
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Shyamal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        loadUserContentListController()
        
        return true
    }
    
    // MARK: - Load User Content List Controller
    
    func loadUserContentListController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let cntUserContentList = UserContentListViewController()
        let service = UserContentAPI.init()
        let viewModel = UserContentViewModel.init(content: [], service: service, title: "")
        cntUserContentList.viewModel = viewModel
        
        let nav = UINavigationController(rootViewController: cntUserContentList)
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}

