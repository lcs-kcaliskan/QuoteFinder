//
//  Quote.swift
//  QuoteFinder
//
//  Created by Ahmet Kaan Caliskan on 2025-04-03.
//


import Foundation

struct Quote: Identifiable, Codable {
    let id = UUID()
    let quoteText: String
    let quoteAuthor: String
}
