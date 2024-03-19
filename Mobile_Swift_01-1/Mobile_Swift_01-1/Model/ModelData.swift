//
//  ModelData.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 10.02.2024.
//

import Foundation
import Alamofire

class ModelData {
    init() {
        Task {
            try await AddProducts()
        }
    }
    
    func AddProducts() async throws  {
        var r = DetailPhoto(id: 1)
        guard let url = URL(string: "https://ozisapp.ru/get_products") else { fatalError("Missing URL") }
        let products =  try await AF.request(url).serializingDecodable([Product].self).value
        let bd = RealmManager.shared
        for item in products {
            bd.add(product: ProductBase(product: item))
        }
//        for i in 0..<products.count  {
//            let url = URL(string: "https://ozisapp.ru/get_image?id=" + String(products[i].id))!
//            async let firstImageTask = URLSession.shared.data(from: url)
//            let (data, _) = try await firstImageTask
//            bd.updateImage(id: products[i].id, image: data)
//        }
        
        for item in products {
            let url = URL(string: "https://ozisapp.ru/get_image?id=" + String(item.id))!
            let (data, _) = try await URLSession.shared.data(from: url)
            bd.updateImage(id: item.id, image: data)
        }
        
//        AF.request(url).responseDecodable(of: [Product].self) { response in
//            switch response.result {
//                case .success(let decodedData):
//                    
////                let (data, _) = try await URLSession.shared.data(from: imageUrl)
//                case .failure(let error):
//                    print(error)
//            }
//        }
    }
}
