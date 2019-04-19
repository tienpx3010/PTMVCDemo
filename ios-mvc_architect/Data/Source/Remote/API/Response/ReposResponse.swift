//
//  SearchResponse.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import ObjectMapper

final class ReposResponse: Mappable {
    
    var totalCount: Int?
    var repos = [Repo]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        totalCount <- map["total_count"]
        repos <- map["items"]
    }
}

