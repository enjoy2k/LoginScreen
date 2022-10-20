//
//  Person.swift
//  LoginScreen
//
//  Created by Даниил Козлов on 20.10.2022.
//

struct User {
    let login: String
    let password: String
    let danya: Person
//    Создать метод который возвращает Экземпляр модели Person
    static func getUserInfo() -> Person {
        
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let about: String
}
