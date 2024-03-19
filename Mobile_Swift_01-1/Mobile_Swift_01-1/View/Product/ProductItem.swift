//
//  Product.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 20.02.2024.
//

import SwiftUI

struct ProductItem: View {
    let product: ProductBase
    let sizeItem: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            ProductImage(imageData: product.image, sizeImage: sizeItem)
            Text(Int(product.price).description + "₽")
                .font(.headline)
            Text(product.desc)
                .font(.callout)
                .frame(width: sizeItem)
                .lineLimit(2)
        }
    }
}

#Preview {
    ProductItem(product: ProductBase.default, sizeItem: 155)
}
