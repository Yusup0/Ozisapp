//
//  ProductDetail.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 03.03.2024.
//

import SwiftUI

struct ScrollPhoto: View {
    var photo: DetailPhoto
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(photo.photo, id: \.self) {  photo in
                    photo
               }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ScrollPhoto(photo: DetailPhoto(id: 1))
}
