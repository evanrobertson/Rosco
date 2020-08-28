//
//  RoscoView.swift
//  Rosco
//
//  Created by Evan Robertson on 16/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

import AppKit

class RoscoView : NSVisualEffectView {
    
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var artistNameLabel: NSTextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateTrack(_:)), name: Notification.Name("RoscoUpdateTrack"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notPlayingNotificationReceived(_:)), name: Notification.Name("RoscoNotPlaying"), object: nil)
        
        maskImage = NSImage(size: NSSize(width: 100, height: 22), flipped: false) { rect in
            
            let bezierPath = NSBezierPath()
            bezierPath.move(to: NSPoint(x: 0, y: 22))
            bezierPath.curve(to: NSPoint(x: 13, y: 22), controlPoint1: NSPoint(x: 0, y: 22), controlPoint2: NSPoint(x: -8, y: 22))
            bezierPath.curve(to: NSPoint(x: 58, y: 8), controlPoint1: NSPoint(x: 34, y: 22), controlPoint2: NSPoint(x: 43, y: 14))
            bezierPath.curve(to: NSPoint(x: 100, y: 0), controlPoint1: NSPoint(x: 73, y: 2), controlPoint2: NSPoint(x: 100, y: 0))
            bezierPath.line(to: NSPoint(x: 0, y: 0))
            bezierPath.line(to: NSPoint(x: 0, y: 22))
            bezierPath.close()
            bezierPath.fill()
            
            return true
        }
        maskImage?.capInsets = NSEdgeInsets(top: 0.0, left: 1.0, bottom: 0.0, right: 88.0)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func updateLayer() {
        
    }
    
    override func viewWillMove(toWindow newWindow: NSWindow?) {
        // Default to not playing
        notPlaying()
    }
    
    func notPlaying() {
        titleLabel.stringValue = "Not Playing"
        artistNameLabel.stringValue = ""
    }

    @objc func didUpdateTrack(_ notification: NSNotification) {
        guard let track = notification.object as? Track else {
            notPlaying()
            return
        }
        
        titleLabel.stringValue = track.name.truncate(length: 32, trailing: "…")
        artistNameLabel.stringValue = track.artist.truncate(length: 32, trailing: "…")
    }
    
    @objc func notPlayingNotificationReceived(_ notification: NSNotification) {
        notPlaying()
    }
}
