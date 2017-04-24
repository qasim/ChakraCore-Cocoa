//
//  AppDelegate.swift
//  ChakraCore-Cocoa
//
//  Created by Qasim Iqbal on 2017-04-24.
//  Copyright © 2017 Qasim Iqbal. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  var chakraCore: ChakraCoreManager!

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    chakraCore = ChakraCoreManager()

    if let sourcePath = Bundle.main.path(forResource: "hello", ofType: "js") {
      let result = chakraCore.executeJavaScript(fromSourcePath: sourcePath)
      print(result)
    }
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

}
