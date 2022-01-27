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

    @IBOutlet var sizeMiniMenuItem: NSMenuItem!
    @IBOutlet var sizeSmallMenuItem: NSMenuItem!
    @IBOutlet var sizeRegularMenuItem: NSMenuItem!

    let styleKey = "RoscoStyle"
    let sizeKey = "RoscoSize"

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

        let appSizeRaw = UserDefaults.standard.object(forKey: sizeKey) as? UInt ?? 0
        let appSize = NSControl.ControlSize(rawValue: appSizeRaw) ?? .small
        setSizeMenuStates(forSize: appSize)
        setAppSize(appSize)
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

    func setSizeMenuStates(forSize size: NSControl.ControlSize) {
        sizeMiniMenuItem.state = size == .mini ? .on : .off
        sizeSmallMenuItem.state = size == .small ? .on : .off
        sizeRegularMenuItem.state = size == .regular ? .on : .off
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

    func setAppSize(_ size: NSControl.ControlSize?) {
        let size = size ?? .small
        UserDefaults.standard.set(size.rawValue, forKey: sizeKey)

        if let roscoView = getRoscoView() {
            roscoView.setSize(size)
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

    @IBAction func selectSize(_ sender: Any) {
        guard let item = sender as? NSMenuItem else { return }

        var size: NSControl.ControlSize = .small

        switch item.title {
        case "Mini":
            size = .mini

        case "Small":
            size = .small

        case "Regular":
            size = .regular

        default:
            break
        }

        setAppSize(size)
        setSizeMenuStates(forSize: size)
    }
}
