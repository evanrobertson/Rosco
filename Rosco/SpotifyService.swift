//
//  SpotifyService.swift
//  Rosco
//
//  Created by Evan Robertson on 19/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//
import Cocoa
import ScriptingBridge
import Chronos

class SpotifyService {
    var timer: DispatchTimer!
    var app: SpotifyApplication?
    var lastTrack: Track?
    
    init () {
            timer = DispatchTimer(interval: 2.5, closure: {
                (timer: RepeatingTimer, count: Int) in
                
                if self.isSpotifyRunning() {
                    if (self.app == nil) {
                        self.app = self.getSpotifyApplication()
                    }
                    
                    if let track = self.app?.currentTrack,
                        let artist = track?.artist,
                        let name = track?.name {
                            var currentTrack = Track(name: name, artist: artist)
                            self.sendUpdateTrackNotification(currentTrack)
                    } else {
                        self.sendNotPlayingNotification()
                    }
                } else {
                    self.sendNotPlayingNotification()
                }
            })
            timer.start(true)
    }
    
    func getSpotifyApplication () -> SpotifyApplication {
        return SBApplication(bundleIdentifier: "com.spotify.client")
    }
    
    func isSpotifyRunning() -> Bool {
        let runningApps = NSRunningApplication.runningApplicationsWithBundleIdentifier("com.spotify.client")
        return runningApps.count > 0
    }
    
    func sendUpdateTrackNotification(track: Track) {
        if (lastTrack != track) {
            lastTrack = track
            NSNotificationCenter.defaultCenter().postNotificationName("RoscoUpdateTrack", object: track)
        }
    }
    
    func sendNotPlayingNotification() {
        lastTrack = nil
        NSNotificationCenter.defaultCenter().postNotificationName("RoscoNotPlaying", object: nil)
    }
}
