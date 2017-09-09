//
//  MongoController.swift
//  MongoDB
//
//  Created by ALIA M NEELY on 9/8/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class MongoController {
    
    static let messageUrl = URL(string: "https://api.mlab.com/api/1/databases/apptest/collections/message?apiKey=Oh-Ity21lz0x7N0ZNzMbpJCxjlx7le4w")
    
    static let testUrl = URL(string: "https://api.mlab.com/api/1/databases/apptest/collections/test?apiKey=Oh-Ity21lz0x7N0ZNzMbpJCxjlx7le4w")
    
    static var shared = MongoController()
    
    var messages: [MGMessage] = []

    
    func postMessage(message: MGMessage, completion: @escaping (Bool) -> Void) {
        
        guard let url = MongoController.messageUrl else { completion(false); return }
        
        //make and send network request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = message.data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data,_, error) in
            
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else { completion(false); return }
            
            if let error = error {
                print("There was an error posting. Error: \(error.localizedDescription)")
                completion(false); return
            } else if responseDataString.contains("error") { print("\(error?.localizedDescription ?? "Error")") }
            else {completion(true)}
            
        }
        dataTask.resume()
    }
    
    func fetchTest(completion: @escaping ([MGMessage]) -> Void) {
        
        guard let baseurl = MongoController.testUrl else { completion([]); return }
        
        var request = URLRequest(url: baseurl)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data,_, error) in
            if let error = error { print(error.localizedDescription); completion([]); return}
            
            guard let data = data,
                let smessagesDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
                    as? [[String:Any]] else  { completion([]); return }
            
            let messages = smessagesDictionary.flatMap({ MGMessage(json: $0 )})
            completion(messages)
        }
        dataTask.resume()
    }
    
    
}
