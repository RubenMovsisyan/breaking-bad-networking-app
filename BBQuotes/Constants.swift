//
//  Constants.swift
//  BBQuotes
//
//  Created by Ruben Movsisyan on 3/26/24.
//

import Foundation

enum Constants {
    static let bbName = "Breaking Bad"
    static let bcsName = "Better Call Saul"
}

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
    
    var noSpaces: String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    var lowerNoSpaces: String {
        self.noSpaces.lowercased()
    }
}
