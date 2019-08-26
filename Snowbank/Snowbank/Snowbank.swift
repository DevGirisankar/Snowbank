//
//  Snowbank.swift
//  SnowbankFrameWork
//
//  Created by Giri on 23/08/19.
//  Copyright © 2019 Syoolah. All rights reserved.
//

import Foundation

public class Snowbank{
    
    public static func initWithToken(token:String){
        Constants.userToken = token
    }
    public static func initUser(completion: @escaping (_ JSON: [String: Any]?, _ error: Error?) -> Void){
        
        if Constants.userToken.isEmpty {
            let errorTemp = NSError(domain: "!SnowBank!", code: 2, userInfo: ["Error":"Token not found","message":"Snowbank is not initiated with token!"])
            completion(nil,errorTemp)
            return
        }
        // Set up the URL request
        let headers = ["Authorization": Constants.userToken,"Content-Type": "application/json"]
        
        let todoUrl: String = Constants.baseurl + "init-user"
        
        guard let url = URL(string: todoUrl) else {
            print("Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            // make sure we got data
            guard let responseData = data else {
                completion(nil, nil)
                return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let JSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    completion(nil, nil)
                    return
                }
                
                
                completion(JSON, nil)
                
            } catch let error {
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
        
        
        task.resume()
        
    }
    
    
    
}
