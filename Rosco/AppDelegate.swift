//
//  AppDelegate.swift
//  Rosco
//
//  Created by Evan Robertson on 16/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var nowPlayingService: NowPlayingService?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        nowPlayingService = NowPlayingService()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func toggleLightDark(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("RoscoToggleLightDark"), object: nil)
    }
}

