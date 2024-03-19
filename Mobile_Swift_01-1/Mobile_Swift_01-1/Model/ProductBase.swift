//
//  ProductBase.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 10.02.2024.
//

import Foundation
import RealmSwift

final class ProductBase: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String = ""
    @Persisted var fabricator: String = ""
    @Persisted var type: String = ""
    @Persisted var price: Double = 423.12
    @Persisted var desc: String = "hjhbhj jhbh j jhbjhb vijiojioiojj jhvhj vjh jhvjv"
    @Persisted var image: Data = Data()
    
    static let `default` = ProductBase()
    
    init(product: Product) {
        super.init()
        self.id = product.id
        self.name = product.name
        self.fabricator = product.fabricator
        self.type = product.type
        self.price = product.price
        self.desc = product.description
    }
    
    override init() {}

}
