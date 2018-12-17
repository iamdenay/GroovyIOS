//
//  AppDelegate.swift
//  Groovy
//
//  Created by Atabay Ziyaden on 12/17/18.
//  Copyright © 2018 IcyFlame Studios. All rights reserved.
//

import UIKit
import Sugar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        coordinateAppFlow()
        return true
    }
    
    fileprivate func coordinateAppFlow() {
        window = UIWindow(frame: UIScreen.main.bounds).then {
            $0.backgroundColor = .white
        }
        
        if let user = User.current {
//            PFInstallation.current()!["user"] = User.current()
//            PFInstallation.current()?.saveInBackground()
//            self.loadMainScreens()
//            DispatchQueue.main.async {
//                user.fetchInBackground() { success, error in
//                    if let _ = success{
//                        if user["isPhoneVerified"] as! Bool{
//                            if (user["firstName"]) == nil {
//                                self.loadFormScreens()
//                            }
//                        }else{
//                            self.resend()
//                            self.loadConfirmationScreens()
//                        }
//                    }else if error != nil{
//                    }
//                }
//            }
        } else {
//            loadAuthScreens()
        }
    }


}

