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
    @IBOutlet var menu: NSMenu!
    @IBOutlet var systemDefaultStyleMenuItem: NSMenuItem!
    @IBOutlet var lightMenuItem: NSMenuItem!
    @IBOutlet var darkMenuItem: NSMenuItem!

    let styleKey = "RoscoStyle"

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    var nowPlayingService: NowPlayingService?

    func applicationDidFinishLaunching(_: Notification) {
        NSApp.setActivationPolicy(.accessory)
        nowPlayingService = NowPlayingService()
        statusItem.button?.image = NSImage(named: NSImage.Name("status_bar_icon"))
        statusItem.menu = menu

        // Set the display style from defaults
        let appearanceName = UserDefaults.standard.object(forKey: styleKey) as? NSAppearance.Name
        setStyleMenuStates(appearanceName: appearanceName)
        setAppStyle(appearanceName: appearanceName)
    }

    func applicationWillTerminate(aNotification _: NSNotification) {
        // Insert code here to tear down your application
    }

    func getRoscoView() -> RoscoView? {
        if let window = NSApplication.shared.windows.first(where: { $0.contentView is RoscoView }),
           let roscoView = window.contentView as? RoscoView
        {
            return roscoView
        }

        return nil
    }

    func setStyleMenuStates(appearanceName: NSAppearance.Name?) {
        systemDefaultStyleMenuItem.state = appearanceName == nil ? .on : .off
        lightMenuItem.state = appearanceName == NSAppearance.Name.vibrantLight ? .on : .off
        darkMenuItem.state = appearanceName == NSAppearance.Name.vibrantDark ? .on : .off
    }

    func setAppStyle(appearanceName: NSAppearance.Name?) {
        var appearance: NSAppearance?

        if let appearanceName = appearanceName {
            appearance = NSAppearance(named: appearanceName)
            UserDefaults.standard.set(appearanceName, forKey: styleKey)
        } else {
            UserDefaults.standard.removeObject(forKey: styleKey)
        }

        if let roscoView = getRoscoView() {
            roscoView.appearance = appearance
        }
    }

    @IBAction func selectSystemDefaultStyle(_: Any) {
        setStyleMenuStates(appearanceName: nil)
        setAppStyle(appearanceName: nil)
    }

    @IBAction func selectLightStyle(_: Any) {
        let appearanceName = NSAppearance.Name.vibrantLight
        setStyleMenuStates(appearanceName: appearanceName)
        setAppStyle(appearanceName: appearanceName)
    }

    @IBAction func selectDarkStyle(_: Any) {
        let appearanceName = NSAppearance.Name.vibrantDark
        setStyleMenuStates(appearanceName: appearanceName)
        setAppStyle(appearanceName: appearanceName)
    }
}
