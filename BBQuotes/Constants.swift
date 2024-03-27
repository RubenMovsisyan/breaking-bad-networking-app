//
//  Constants.swift
//  BBQuotes
//
//  Created by Ruben Movsisyan on 3/26/24.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
