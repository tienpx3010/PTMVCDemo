//
//  SearchRequest.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import ObjectMapper
import Alamofire

final class SearchRequest: BaseRequest {
    
    required init(page: Int, perPage: Int = 10) {
        let parameters: [String: Any]  = [
            "q": "language:swift",
            "per_page": perPage,
            "page": page
        ]
        super.init(url: Urls.getRepoList, requestType: .get, parameters: parameters)
    }
}
