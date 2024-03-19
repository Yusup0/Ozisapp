//
//  RealmManager.swift
//  Mobile_Swift_01-1
//
//  Created by Юсуп Оздоев on 10.02.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    private(set) var localRealm: Realm?
    private let dispatchQueue = DispatchQueue(label: "background", qos: .background)
    static let shared = RealmManager()

    init() {
        openRealm()
    }

    func openRealm() {
        dispatchQueue.async {
            do {
                let config = Realm.Configuration(schemaVersion: 1)
                Realm.Configuration.defaultConfiguration = config
                self.localRealm = try Realm()
            } catch {
                print("Error opening Realm", error)
            }
        }
    }

//    func Read() -> Results<Recipe>? {
//        return localRealm?.objects(Recipe.self)
//    }

    func add(product: ProductBase) {
        dispatchQueue.async {
            do {
                let localRealm = try Realm()
                try localRealm.write {
                    localRealm.add(product, update: .all)
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func updateImage(id: Int, image: Data) {
        dispatchQueue.async {
                do {
                    let localRealm = try Realm()
                    let productToUpdate = localRealm.objects(ProductBase.self).filter("id == %@", id)
                    guard !productToUpdate.isEmpty else { return }
                    try localRealm.write {
                        productToUpdate[0].image = image
                    }
                } catch {
                    print("Error updating task \(id) to Realm: \(error)")
                }
            }
    }
    
//    func UpdateFromRecipe(recipe: Product) {
//        if let localRealm = localRealm {
//            do {
//                let recipeToUpdate = localRealm.objects(Recipe.self).filter(NSPredicate(format: "id == %@", recipe.id))
//                guard !recipeToUpdate.isEmpty else { return }
//                try localRealm.write {
//                    recipeToUpdate[0].name = recipe.name
//                    recipeToUpdate[0].preparation = recipe.preparation
//                    recipeToUpdate[0].image = recipe.image
//                    recipeToUpdate[0].pathImage = recipe.pathImage
//                }
//            } catch {
//                print("Error updating task \(recipe.id) to Realm: \(error)")
//            }
//        }
//    }

    func deleteTask(id: String) {
        do {
            let localRealm = try Realm()
            let taskToDelete = localRealm.objects(ProductBase.self).filter(NSPredicate(format: "id == %@", id))
            guard !taskToDelete.isEmpty else { return }
            try localRealm.write {
                localRealm.delete(taskToDelete)
            }
        } catch {
            print("Error deleting task \(id) to Realm: \(error)")
        }
    }
    
//    func beginWrite() -> Bool {
//        let localRealm = try Realm()
//        localRealm.beginWrite()
//        return true
//    
//        return false
//    }
    
//    func commitWrite() {
//        do {
//            try localRealm?.commitWrite()
//        } catch {
//            print("Error commit task to Realm: \(error)")
//        }
//    }
    
    func haveId(id: String) -> Bool {
        do {
            let localRealm = try Realm()
            let task = localRealm.objects(ProductBase.self).filter(NSPredicate(format: "id == %@", id))
            return !task.isEmpty
        } catch {
            print(error)
        }
        return false
    }
}

