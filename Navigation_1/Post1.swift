//
//  Post1.swift
//  Navigation_1
//
//  Created by Таисия Кутявина on 19.10.2022.
//

import Foundation

struct Post1 {
    let author: String?
    let description: String?
    let imageName: String?
    let likes: Int?
    let views: Int?
}

let firstPost = Post1(author: "Иванов Иван", description: "Моя новая машина", imageName: "auto", likes: 25, views: 50)
let secondPost = Post1(author: "Катя", description: "Любимая кошка", imageName: "cat", likes: 100, views: 150)
let thirdPost = Post1(author: "Евгений Васильевич", description: "Приготовил пасту по новому рецепту", imageName: "pasta", likes: 35, views: 67)
let fourthPost = Post1(author: "Таисия Луговая", description: "Фестиваль тюльпанов 2022", imageName: "fest", likes: 70, views: 100)

