//
//  Quote.swift
//  BBQuotes
//
//  Created by Ruben Movsisyan on 3/26/24.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}
