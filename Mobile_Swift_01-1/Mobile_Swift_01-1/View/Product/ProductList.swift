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
    @State private var path = NavigationPath()
    
//    let columns = 2
    var body: some View {
        let viewWidth = UIScreen.screenWidth
        let minSpace: CGFloat = viewWidth * 0.035
        let countItem = (viewWidth / 200).rounded()
        let sizeItem = ((viewWidth  - (countItem + 1) * minSpace) / countItem).rounded(.down)
        

        NavigationStack(path: $path) {
            List {
                WrappingHStack(product, id:\.self, spacing:WrappingHStack.Spacing.dynamic(minSpacing: minSpace), lineSpacing: 5) { base in
                    Button {
                        path.append(base)
                    } label: {
                        ProductItem(product: base, sizeItem: sizeItem)
                    }
                }
                .padding(minSpace)
                .frame(width: viewWidth)
            }
            .navigationDestination(for: ProductBase.self) { base in
                ProductDetail(product: base)
            }
        }
//        NavigationSplitView {
//            List {
//                ForEach(0..<(product.count / Int(countItem))) { i in
//                    HStackLayout {
//                        ForEach(0..<Int(countItem)) { j in
//                            let index: Int = i * Int(countItem) + j
//                            NavigationLink {
//                                ProductDetail(product: product[index])
//                            } label: {
////                                EmptyView()
//                                ProductItem(product: product[index], sizeItem: sizeItem)
//                            }
////                            .opacity(0)
//                        }
//                    }
//                    .padding()
//                }
//                ForEach (product) { base in
//                    HStack {
//                        NavigationLink {
//                            ProductDetail(product: base)
//                        } label: {
//                            ProductItem(product: base, sizeItem: sizeItem)
//                        }
//                        NavigationLink {
//                            ProductDetail(product: base)
//                        } label: {
//                            ProductItem(product: base, sizeItem: sizeItem)
//                        }
//                    }
//                }
//                WrappingHStack(product, id:\.self, spacing:WrappingHStack.Spacing.dynamic(minSpacing: minSpace), lineSpacing: 5) { base in
//                    NavigationLink {
//                        ProductDetail(product: base)
//                    } label: {
//                        ProductItem(product: base, sizeItem: sizeItem)
//                    }
//                }
//                .padding(minSpace)
//                .frame(width: viewWidth)
//            }
//            .listStyle(.inset)
//            .padding()
//        } detail: {
//            Text("Select a Landmark")
//        }
    }
}

#Preview {
    ProductList()
}
