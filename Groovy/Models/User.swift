

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class User : Mappable {
    var id:Int?
    var email:String?
    var firstName:String?
    var lastName:Double?
    var isVerified:Int?
    var verificationCode:String?
    
    class var current: User? {
        get {
            return loadCurrentUser()
        }
        set {
            saveCurrentUser(user: newValue)
        }
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }
    
    class func loginWithUsername(username: String,
                                 andPassword password: String,
                                 callback: @escaping (User?, Error?) -> Void) {
        // Access the web API
        let parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request("https://api.yourwebsite.com/login", method: .post,
                          parameters: parameters).responseObject { (response: DataResponse<User>) in
                            print("Request: \(String(describing: response.request!))")
                            print("Response: \(String(describing: response.response!))")
                            print("Error: \(String(describing: response.error))")
                            print("Result: \(response.result)")
                            
                            if let res = response.result.value {
                                let user = res
                                current = user
                                callback(current, nil)
                            } else {
                                let error: Error? = NSError(domain:"", code:1, userInfo:nil)
                                callback(nil, error)
                            }
        }
    }
    
    class func logout() {
        deleteCurrentUser()
    }
    
    class private func saveCurrentUser(user:User?) {
        // In this process, you encode the user to file and store it
    }
    
    class private func loadCurrentUser() -> User? {
        // In this process, you get the file and decode that to EDUser object
        // This function will return nil if the file is not exist
    }
    
    class private func deleteCurrentUser() {
        // This will delete the current user file from disk
    }
}

