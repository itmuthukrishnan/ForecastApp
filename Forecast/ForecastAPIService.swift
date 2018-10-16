//
//  ForecastAPIService.swift
//  Forecast
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

class ForecastAPIService: NSObject {
    
    static func getAPIRequestMethod(urlRequest: URLRequest?,
                                    completionHandler:@escaping ((Any?, Error?) -> ()))
    {
        
        guard let apiURLRequest = urlRequest, let _ = apiURLRequest.url else {
            debugPrint("Error: Could not find URL")
            let error = BackendError.urlError(reason: "Could not find URL")
            completionHandler(nil, error)
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: apiURLRequest) { (data, response, error) in
            
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            
            guard let responseData = data, let httpResponse = response as? HTTPURLResponse else {
                debugPrint("Error: did not receive data")
                let error = BackendError.objectSerialization(reason: "No data in response")
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            debugPrint(httpResponse.statusCode)
            let decoder = JSONDecoder()
            do {
                let resultantModel = try decoder.decode(ForecastModel.self, from: responseData)
                DispatchQueue.main.async { completionHandler(resultantModel, nil)
                }
            } catch {
                debugPrint("error trying to convert data to JSON")
                debugPrint(error)
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
        }
        
        task.resume()
    }
}
