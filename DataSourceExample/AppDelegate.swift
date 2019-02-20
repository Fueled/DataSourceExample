//
//  AppDelegate.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 15/06/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		self.window?.tintColor = UIColor.DataSourceExample.red
		return true
	}

}
