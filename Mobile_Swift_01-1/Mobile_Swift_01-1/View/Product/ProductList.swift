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
        let viewWidth = UIScreen.screenWidth
        let minSpace: CGFloat = viewWidth * 0.035
        let countItem = (viewWidth / 200).rounded()
        let sizeItem = ((viewWidth  - (countItem + 1) * minSpace) / countItem).rounded(.down)
        NavigationSplitView {
            ScrollView {
                WrappingHStack(product, id:\.self, spacing:WrappingHStack.Spacing.dynamic(minSpacing: minSpace), lineSpacing: 5) { base in
                    NavigationLink {
                        ProductDetail(product: base)
                    } label: {
                        ProductItem(product: base, sizeItem: sizeItem)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(minSpace)
//                .frame(width: viewWidth)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    ProductList()
}
