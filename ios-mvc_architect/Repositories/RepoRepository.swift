//
//  RepoRepository.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import ObjectMapper

protocol RepoRepositoryType {
    func fetchRepo(page: Int, completion: @escaping (BaseResult<ReposResponse>) -> Void)
}

final class RepoRepository: RepoRepositoryType {
    private var api: APIService?
    
    required init(api: APIService) {
        self.api = api
    }
    
    func fetchRepo(page: Int, completion: @escaping (BaseResult<ReposResponse>) -> Void) {
        let input = ReposRequest(page: page)
        
        api?.request(input: input) { (object: ReposResponse?, error) in
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
