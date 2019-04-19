//
//  BaseRequest.swift
//  ios-mvc_architect
//
//  Created by Phạm Xuân Tiến on 4/19/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import Alamofire

typealias JSONDictionary = [String: Any]

class BaseRequest { // swiftlint:disable:this final_class
    var url = ""
    var requestType = Alamofire.HTTPMethod.get
    var parameters: [String: Any]?
    
    init(url: String) {
        self.url = url
    }
    
    init(url: String, requestType: Alamofire.HTTPMethod) {
        self.url = url
        self.requestType = requestType
    }
    
    init(url: String, requestType: Alamofire.HTTPMethod, parameters: [String: Any]?) {
        self.url = url
        self.requestType = requestType
        self.parameters = parameters
    }
    
    var encoding: ParameterEncoding {
        switch requestType {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}

extension BaseRequest: CustomStringConvertible {
    var description: String {
        if requestType == .get {
            return [
                "🌎 \(requestType.rawValue) \(url)"].joined(separator: "\n")
        }
        return [
            "🌎 \(requestType.rawValue) \(url)",
            "Parameters: \(String(describing: parameters ?? JSONDictionary()))"].joined(separator: "\n")
    }
}

