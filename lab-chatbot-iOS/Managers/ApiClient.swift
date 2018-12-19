//
//  ApiClient.swift
//  lab-chatbot-iOS
//
//  Created by Francesca Valeria Haro Dávila on 12/19/18.
//  Copyright © 2018 Belatrix. All rights reserved.
//

import Foundation
import Alamofire


func postChatBot(){
    
    let url = "http://chabotbe.mybluemix.net/dialog_mobile/conversation"
    let parameters = ["message": "new message"]
    
    
    Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
        .responseJSON { response in
            print(response)
            //to get status code
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    print("example success")
                default:
                    print("error with response status: \(status)")
                }
            }
            //to get JSON return value
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                print(JSON)
            }
    }
    
}

