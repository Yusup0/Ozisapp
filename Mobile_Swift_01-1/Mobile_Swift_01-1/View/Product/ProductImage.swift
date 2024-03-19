//
//  ProductImage.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 21.02.2024.
//

import SwiftUI

struct ProductImage: View {
    var imageData: Data
    let sizeImage: CGFloat
    var body: some View {
        let uiImage = UIImage(data: imageData)
        let contend = uiImage == nil ? Image("qwe") : Image(uiImage: uiImage!)
        contend
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: sizeImage, height: sizeImage)
            .clipped()
            .cornerRadius(10)
    }
}

#Preview {
    ProductImage(imageData: Data(), sizeImage: 155)
}
