//
//  Quote.swift
//  QuoteFinder
//
//  Created by Ahmet Kaan Caliskan on 2025-04-03.
//


import Foundation

struct Quote: Identifiable, Codable {
    var id: UUID { UUID() }  
    let quoteText: String
    let quoteAuthor: String
}
