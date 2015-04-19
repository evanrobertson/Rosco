//
//  RoscoPanel.swift
//  Rosco
//
//  Created by Evan Robertson on 16/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

import AppKit

class RoscoPanel : NSPanel {
    //MARK: TODO: I found this on google, I should put a reference here to that if I can find it again
    
    /// Just in case Apple decides to make `_cornerMask` public and remove the underscore prefix,
    /// we name the property `cornerMask`.
    @objc dynamic var cornerMask: NSImage?
    
    /// This private method is called by AppKit and should return a mask image that is used to
    /// specify which parts of the window are transparent. This works much better than letting
    /// the window figure it out by itself using the content view's shape because the latter
    /// method makes rounded corners appear jagged while using `_cornerMask` respects any
    /// anti-aliasing in the mask image.
    @objc dynamic func _cornerMask() -> NSImage? {
        return cornerMask
    }
}
