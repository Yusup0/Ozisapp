//
//  DetailPhoto.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 03.03.2024.
//

import Foundation
import SwiftUI

@Observable
class DetailPhoto {
    let id: Int
    var photo: [ProductImage] = []
    
    init(id: Int) {
        self.id = id
        Task {
            try await add()
        }
    }
    
    func add() async throws {
        let url = URL(string: "https://ozisapp.ru/test?id=1")!
        print("123\n")
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try? JSONSerialization.jsonObject(with:data, options: []) as? [String]
        print(result![0])
        print("1\n")
    }
}
