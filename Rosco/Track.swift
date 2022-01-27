//
//  Track.swift
//  Rosco
//
//  Created by Evan Robertson on 16/04/2015.
//  Copyright (c) 2015 Evan Robertson. All rights reserved.
//

class Track: Equatable {
    let artist: String
    let name: String

    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
}

// MARK: Equatable

func == (lhs: Track, rhs: Track) -> Bool {
    return lhs.artist == rhs.artist && lhs.name == rhs.name
}
