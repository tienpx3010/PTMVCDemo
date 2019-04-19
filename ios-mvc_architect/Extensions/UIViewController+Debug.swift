//
//  UIViewController+Debug.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

extension UIViewController {
    func logDeinit() {
        print(String(describing: type(of: self)) + " deinit")
    }
}
