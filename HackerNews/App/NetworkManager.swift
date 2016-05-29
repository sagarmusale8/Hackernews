//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Sagar Musale on 15/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//


import Alamofire

class NetworkManager: NSObject {
    
    // Creating single instance with threading
    class NetworkManager {
        class var sharedInstance: NetworkManager {
            struct Static {
                static var onceToken: dispatch_once_t = 0
                static var instance: NetworkManager? = nil
            }
            dispatch_once(&Static.onceToken) {
                Static.instance = NetworkManager()
            }
            return Static.instance!
        }
    }
    
    // Making request 
    func makeRequestWithRequestType(additionalURL: String, requestType: String, withParameters parameters: NSMutableDictionary, withCompletion completion: (success: Bool, response: AnyObject?, error: NSError?)->Void){
        if let methodType = Alamofire.Method.init(rawValue: requestType){
            let requestUrl = ProjectConstant.URL_BASE_SERVER + additionalURL
            
            Alamofire.request(
                methodType,
                requestUrl,
                parameters: NSDictionary(dictionary: parameters) as? [String : AnyObject],
                encoding: .URL)
                .validate()
                .responseJSON { (response) -> Void in
                    guard response.result.isSuccess else {
                        print("Error while fetching remote rooms: \(response.result.error)")
                        completion(success: response.result.isSuccess, response: response.result.value, error: response.result.error)
                        return
                    }
                    print("Got response with descp: \(response.result.value)")
                    completion(success: response.result.isSuccess, response: response.result.value, error: response.result.error)
            }
        }
    }
}
