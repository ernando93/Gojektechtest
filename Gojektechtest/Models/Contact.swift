//
//  Contact.swift
//  Gojektechtest
//
//  Created by Ernando Kasaluhe on 15/09/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

final class Contact: NSObject {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var profilePic: String
    var favorite: Bool
    var url: String
    var createdAt: String
    var updatedAt: String
    
    init?(dictionary: [String: Any]) {
        if let id = dictionary["id"] as? Int {
            self.id = id
        } else {
            self.id = 0
        }
        
        if let firstName = dictionary["first_name"] as? String {
            self.firstName = firstName
        } else {
            self.firstName = ""
        }
        
        if let lastName = dictionary["last_name"] as? String {
            self.lastName = lastName
        } else {
            self.lastName = ""
        }
        
        if let email = dictionary["email"] as? String {
            self.email = email
        } else {
            self.email = ""
        }
        
        if let phoneNumber = dictionary["phone_number"] as? String {
            self.phoneNumber = phoneNumber
        } else {
            self.phoneNumber = ""
        }
        
        if let profilePic = dictionary["profile_pic"] as? String {
            self.profilePic = profilePic
        } else {
            self.profilePic = ""
        }
        
        if let favorite = dictionary["favorite"] as? Bool {
            self.favorite = favorite
        } else {
            self.favorite = false
        }
        
        if let url = dictionary["url"] as? String {
            self.url = url
        } else {
            self.url = ""
        }
        
        if let createdAt = dictionary["created_at"] as? String {
            self.createdAt = createdAt
        } else {
            self.createdAt = ""
        }
        
        if let updatedAt = dictionary["updated_at"] as? String {
            self.updatedAt = updatedAt
        } else {
            self.updatedAt = ""
        }
    }
}

extension Contact: ResponseDataConvertible {
    convenience init?(rawData: Any) {
        if let dictionary = rawData as? [String: Any] {
            self.init(dictionary: dictionary)
        } else {
            return nil
        }
    }
}

//MARK: - Authentication
extension Contact {
    enum ContactResult {
        case success(Contact)
        case failure(Error)
    }
    
    static func getDetails(withId id: Int,
                                 completionHandler: @escaping(ContactResult) -> Void) {
        DetailRequest(id: id).send() { result in
            
            switch result {
                
            case .success(let response):
                if let detail = response.resultData {
                    completionHandler(.success(detail))
                } else {
                    completionHandler(.failure(RequestError.invalidReturnedJSON))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    static func editDetails(withId id: Int,
                                    withFirstName firstName: String,
                                    withLastName lastName: String,
                                    withPhoneNumber phoneNumber: String,
                                    andEmail email: String,
                                    completionHandler: @escaping(ContactResult) -> Void) {
        EditRequest(id: id, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email).send() { result in
            
            switch result {
                
            case .success(let response):
                if let update = response.resultData {
                    completionHandler(.success(update))
                } else {
                    completionHandler(.failure(RequestError.invalidReturnedJSON))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
