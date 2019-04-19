//
//  RepoTableViewCell.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import Kingfisher

final class RepoCell: UITableViewCell, NibReusable {
    // MARK: - IBOutlets
    
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Methods
    
    func setContent(repo: Repo) {
        nameLabel.text = repo.name
        avatarImage.kf.setImage(with: URL(string: repo.avatarURLString))
    }

}
