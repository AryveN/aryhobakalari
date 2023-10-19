//
//  FirstLogin.swift
//  aryhobakalari
//
//  Created by Krystof Hugo Maly on 13.09.2022.
//

import Foundation
import SwiftyJSON

func firstLogin(username: String, password: String) -> Bool {
    let headers = [
        "cookie": "ASP.NET_SessionId=iy2fik0clpsz0jrwyswdqwvq",
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    let localUsername = "&username=" + username
    let localPassword = "&password=" + password
    var loginState = false
    
    let postData = NSMutableData(data: "client_id=ANDR".data(using: String.Encoding.utf8)!)
    postData.append("&grant_type=password".data(using: String.Encoding.utf8)!)
    postData.append(localUsername.data(using: String.Encoding.utf8)!)
    postData.append(localPassword.data(using: String.Encoding.utf8)!)
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://bakalari.uzlabina.cz/api/login")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        let bakalariData = JSON(data)
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            if(httpResponse?.statusCode == 400) {
                print(httpResponse?.statusCode)
                print(bakalariData["error_description"].string)
            } else {
                print("uwu")
                loginState = true
            }
            
        }
    })
    
    dataTask.resume()
    if(loginState) {
        return true
    }
    return false
}
