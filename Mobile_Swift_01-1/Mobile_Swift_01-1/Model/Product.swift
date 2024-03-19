//
//  Product.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 08.02.2024.
//

import Foundation

final class Product: Codable, Identifiable {
    var id: Int
    var name : String
    var fabricator: String
    var type: String
    var price: Double
    var description: String
}

