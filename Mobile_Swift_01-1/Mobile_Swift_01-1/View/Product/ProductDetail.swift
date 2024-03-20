//
//  ProductDetail.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 20.03.2024.
//

import SwiftUI

struct ProductDetail: View {
    let product: ProductBase
    var body: some View {
        ScrollView {
            ScrollPhoto(photo: DetailPhoto(id: product.id))
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        Button {
        } label: {
            VStack {
                Text("В корзину")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                Text("Доставим когда-нибудь")
                    
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
}

#Preview {
    ProductDetail(product: ProductBase.default)
}
