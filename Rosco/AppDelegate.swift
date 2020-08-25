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
    @IBOutlet weak var menu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    var nowPlayingService: NowPlayingService?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        nowPlayingService = NowPlayingService()
        statusItem.button?.image = NSImage.init(named: NSImage.Name("status_bar_icon"))
        statusItem.menu = menu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func toggleLightDark(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("RoscoToggleLightDark"), object: nil)
    }
}

