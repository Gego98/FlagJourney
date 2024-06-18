//
//  FlagsData.swift
//  FlagJourney
//
//  Created by Filip Gegovski on 13/05/2024.
//

import Foundation

struct FlagsData: Decodable {
    let name: Name
    let capital: [String]
    let flags: Flags
}

struct Name: Decodable {
    let common: String
}

struct Flags: Decodable {
    let png: String
}
