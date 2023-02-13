//
//  Model.swift
//  TraineeSurf
//
//  Created by Zhuravlev Dmitry on 11.02.2023.
//

import Foundation

struct Profession {
    var name: String
}

extension Profession {
    static let namesArray = [
        Profession(name: "iOS"),
        Profession(name: "Android"),
        Profession(name: "Design"),
        Profession(name: "Flutter"),
        Profession(name: "QA"),
        Profession(name: "PM"),
        Profession(name: "Backend"),
        Profession(name: "Frontend"),
        Profession(name: "CEO"),
        Profession(name: "CTO")
    ]
}
