//
//  SpotifyApplication.swift
//  Rosco
//
//  Created by Evan Robertson on 16/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

import ScriptingBridge

@objc protocol SpotifyTrack {
    var name: String? { get }
    var artist: String? { get }
}

@objc protocol SpotifyApplication {
    optional var soundVolume: Int { get }
    optional var currentTrack: SpotifyTrack? { get }
}

extension SBApplication : SpotifyApplication {}
