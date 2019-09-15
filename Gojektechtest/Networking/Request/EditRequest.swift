//
//  EditRequest.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

struct EditRequest {
    let id: Int
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
}

extension EditRequest: Request {
    var baseURL: URL {
        return URL(fileURLWithPath: kAPIURL)
    }
    
    var path: String {
        return "/contacts/\(id).json"
    }
    
    var method: HTTPMethod {
        return .put
    }
    
    var parameters: [String: Any]? {
        return ["first_name": firstName,
                "last_name": lastName,
                "phone_number": phoneNumber,
                "email": email]
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    typealias ResponseType = SingleDataResponse<Contact>
}
