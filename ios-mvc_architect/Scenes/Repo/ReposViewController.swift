//
//  ViewController.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/18/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

final class ReposViewController: UIViewController { // swiftlint:disable:this final_class
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private let repoRepository = RepoRepositoryImpl(api: APIService.share)
    
    private var repos: [Repo] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        fetchData()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.rowHeight = 65
            $0.register(cellType: RepoCell.self)
        }
    }
    
    private func fetchData() {
        repoRepository.fetchRepo(page: 1) { result in
            switch result {
            case .success(let response):
                guard let data = response?.repos else { return }
                self.repos = data
                self.tableView.reloadData()
            case .failure(let error):
                self.showError(message: error?.errorMessage)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContent(repo: repos[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - StoryboardSceneBased
extension ReposViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.repo
}
