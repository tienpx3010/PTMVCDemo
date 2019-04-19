//
//  MainViewController.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

final class MainViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        
    }
    
    @IBAction private func showRepoTapped(_ sender: Any) {
        let vc = ReposViewController.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - StoryboardSceneBased
extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
