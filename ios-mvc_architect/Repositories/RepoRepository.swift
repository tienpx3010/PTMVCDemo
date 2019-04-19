//
//  RepoRepository.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import ObjectMapper

protocol RepoRepository {
    func fetchRepo(page: Int, completion: @escaping (BaseResult<SearchResponse>) -> Void)
}

final class RepoRepositoryImpl: RepoRepository {
    
    private var api: APIService?
    
    required init(api: APIService) {
        self.api = api
    }
    
    func fetchRepo(page: Int, completion: @escaping (BaseResult<SearchResponse>) -> Void) {
        let input = SearchRequest(page: page)
        
        api?.request(input: input) { (object: SearchResponse?, error) in
            if let object = object {
                completion(.success(object))
            } else if let error = error {
                completion(.failure(error: error))
            } else {
                completion(.failure(error: nil))
            }
        }
    }
}
