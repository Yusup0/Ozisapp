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
    var photo: [ProductImage] = [ProductImage(imageData: Data(), sizeImage: UIScreen.screenWidth)]
    
    init(id: Int) {
        self.id = id
        Task {
            try await add()
        }
    }
    
    func add() async throws {
        let url = URL(string: "https://ozisapp.ru/test?id=" + id.description)!
        print("123\n")
        let (data, _) = try await URLSession.shared.data(from: url)
        let urls = try? JSONSerialization.jsonObject(with:data, options: []) as? [String]
        if let urls = urls {
            photo = Array(repeating: ProductImage(imageData: Data(), sizeImage: UIScreen.screenWidth), count: urls.count)
            for (i, url) in urls.enumerated() {
                let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
                photo[i] = ProductImage(imageData: data, sizeImage: UIScreen.screenWidth)
            }
        }
    }
}
