//
//  SearchRequest.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import Alamofire
import ObjectMapper

final class ReposRequest: BaseRequest {
    required init(page: Int, perPage: Int = 10) {
        let parameters: [String: Any]  = [
            "q": "language:swift",
            "per_page": perPage,
            "page": page
        ]
        super.init(url: Urls.getRepoList, requestType: .get, parameters: parameters)
    }
}
