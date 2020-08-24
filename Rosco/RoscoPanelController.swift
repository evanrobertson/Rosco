//
//  RoscoPanelController.swift
//  Rosco
//
//  Created by Evan Robertson on 16/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

import AppKit

class RoscoPanelController : NSWindowController {

    override func windowDidLoad() {
        if let window = window as? NSPanel {
            window.collectionBehavior = .canJoinAllSpaces
            window.isFloatingPanel = true
            window.setFrameOrigin(NSPoint(x: 0, y: 0))
            window.backgroundColor = NSColor.clear
        }
    }
}
