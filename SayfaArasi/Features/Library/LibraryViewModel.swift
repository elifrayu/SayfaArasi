//
//  LibraryViewModel.swift
//  SayfaArasi
//
//  Created by elif uyar on 24.11.2026.
//

import Foundation

final class LibraryViewModel {
    
    private(set) var books: [Book] = [
        Book(
            id: "1",
            title: "Küçük Prens",
            authors: ["Antoine de Saint-Exupéry"],
            coverURL: nil,
            description: nil
        ),
        Book(
            id: "2",
            title: "Simyacı",
            authors: ["Paulo Coelho"],
            coverURL: nil,
            description: nil
        ),
        Book(
            id: "3",
            title: "Suç ve Ceza",
            authors: ["Dostoyevski"],
            coverURL: nil,
            description: nil
        ),
        Book(
            id: "4",
            title: "Kürk Mantolu Madonna",
            authors: ["Sabahattin Ali"],
            coverURL: nil,
            description: nil
        )
    ]
    }

