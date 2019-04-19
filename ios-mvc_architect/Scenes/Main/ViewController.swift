//
//  ViewController.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/18/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import UIKit

class ViewController: UIViewController { // swiftlint:disable:this final_class
    
    private let repoRepository = RepoRepositoryImpl(api: APIService.share)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        repoRepository.fetchRepo(page: 1) { (result) in
            switch result {
            case .success(let searchResponse):
                break
            case .failure(let error):
                break
            }
        }
    }
}

