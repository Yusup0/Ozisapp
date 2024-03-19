//
//  ProductList.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 20.02.2024.
//

import SwiftUI
import RealmSwift
import WrappingHStack

struct ProductList: View {
    @ObservedResults(ProductBase.self) var product

    var body: some View {
        GeometryReader { proxy in
            let viewWidth = proxy.size.width
            let minSpace: CGFloat = viewWidth * 0.035
            let countItem = (viewWidth / 200).rounded()
            let sizeItem = ((viewWidth  - (countItem + 1) * minSpace) / countItem).rounded(.down)
            List {
                WrappingHStack(product, id:\.self, spacing: WrappingHStack.Spacing.dynamic(minSpacing: minSpace), lineSpacing: 5) {
                    ProductItem(product: $0, sizeItem: sizeItem)
                }
                .padding(minSpace)
                .frame(width: viewWidth)
            }
            .listStyle(.inset)
        }
    }
}

#Preview {
    ProductList()
}
