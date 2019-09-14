//
//  ListContact.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

final class ListContact: NSObject {
    var list = [Contact]()
    
    init?(dictionary: [[String: Any]]) {
        for data in dictionary {
            self.list.append(Contact(dictionary: data)!)
        }
    }
}

extension ListContact: ResponseDataConvertible {
    convenience init?(rawData: Any) {
        if let dictionary = rawData as? [[String: Any]] {
            self.init(dictionary: dictionary)
        } else {
            return nil
        }
    }
}

//MARK: - Authentication
extension ListContact {
    enum ListContactResult {
        case success(ListContact)
        case failure(Error)
    }
    
    static func getList(completionHandler: @escaping(ListContactResult) -> Void) {
        ListRequest().send() { result in
            
            switch result {
                
            case .success(let response):
                if let contacts = response.resultData {
                    completionHandler(.success(contacts))
                } else {
                    completionHandler(.failure(RequestError.invalidReturnedJSON))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
