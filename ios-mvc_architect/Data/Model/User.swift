//
//  Model.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

enum Gender: Int {
    case unknown = 0
    case male = 1
    case female = 2
    
    var name: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        default:
            return "Unknown"
        }
    }
}

struct User {
    var id: String
    var name: String
    var gender: Gender
    var birthday: Date
}

extension User {
    init() {
        self.init(
            id: UUID().uuidString,
            name: "",
            gender: Gender.unknown,
            birthday: Date()
        )
    }
}
