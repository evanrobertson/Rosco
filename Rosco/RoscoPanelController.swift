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

        
        if let window = window as? RoscoPanel {
            window.floatingPanel = true
            window.setFrameOrigin(NSPoint(x: 0, y: 0))
            window.backgroundColor = NSColor.clearColor()
            
            
            let cornerRadius: CGFloat = 50.0
            let edgeLength = 2.0 * cornerRadius + 1.0
            let maskImage = NSImage(size: NSSize(width: 100, height: 22), flipped: false) { rect in
                
                var bezierPath = NSBezierPath()
                bezierPath.moveToPoint(NSPoint(x: 0, y: 22))
                bezierPath.curveToPoint(NSPoint(x: 13, y: 22), controlPoint1: NSPoint(x: 0, y: 22), controlPoint2: NSPoint(x: -8, y: 22))
                bezierPath.curveToPoint(NSPoint(x: 58, y: 8), controlPoint1: NSPoint(x: 34, y: 22), controlPoint2: NSPoint(x: 43, y: 14))
                bezierPath.curveToPoint(NSPoint(x: 100, y: 0), controlPoint1: NSPoint(x: 73, y: 2), controlPoint2: NSPoint(x: 100, y: 0))
                bezierPath.lineToPoint(NSPoint(x: 0, y: 0))
                bezierPath.lineToPoint(NSPoint(x: 0, y: 22))
                bezierPath.closePath()
                bezierPath.fill()
                
                return true
            }
            maskImage.capInsets = NSEdgeInsets(top: 11.0, left: 1.0, bottom: 11.0, right: 86.0)
            //            maskImage.capInsets = NSEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius)
            //            maskImage.resizingMode = .Stretch
            window.cornerMask = maskImage
        }
    }
}
