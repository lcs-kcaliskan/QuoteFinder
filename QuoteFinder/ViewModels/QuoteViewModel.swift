//
//  QuoteViewModel.swift
//  QuoteFinder
//
//  Created by Ahmet Kaan Caliskan on 2025-04-03.
//


import Foundation

class QuoteViewModel: ObservableObject {
    @Published var currentQuote: Quote?

    init() {
        Task {
            await fetchQuote()
        }
    }

    func fetchQuote() async {
        let endpoint = "https://api.quotable.io/random"
        
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("API Response: \(jsonString)")
            }
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(QuoteWrapper.self, from: data)
            
            await MainActor.run {
                self.currentQuote = Quote(quoteText: decodedData.content, quoteAuthor: decodedData.author)
            }
        } catch {
            print("Could not retrieve data from endpoint or decode JSON.")
            print(error)
        }
    }
}

struct QuoteWrapper: Codable {
    let content: String
    let author: String
}
