//
//  RoscoView.swift
//  Rosco
//
//  Created by Evan Robertson on 16/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

import AppKit
import Chronos

class RoscoView : NSVisualEffectView {
    
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var artistNameLabel: NSTextField!
    
    var isDark: Bool
    
    required init?(coder: NSCoder) {
        isDark = true
        
        super.init(coder: coder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didUpdateTrack:", name: "RoscoUpdateTrack", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notPlaying", name: "RoscoNotPlaying", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "toggleLightDark", name: "RoscoToggleLightDark", object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewWillMoveToWindow(newWindow: NSWindow?) {
        // Default to not playing
        notPlaying()
    }

    func didUpdateTrack(notification: NSNotification) {
        var track = notification.object as! Track
        
        titleLabel.stringValue = track.name
        artistNameLabel.stringValue = track.artist
    }
    
    func notPlaying() {
        titleLabel.stringValue = "Not Playing"
        artistNameLabel.stringValue = ""
    }
    
    func toggleLightDark() {
        if (isDark) {
            appearance = NSAppearance(named: NSAppearanceNameVibrantLight)
            isDark = false
        } else {
            appearance = NSAppearance(named: NSAppearanceNameVibrantDark)
            isDark = true
        }
    }
}
