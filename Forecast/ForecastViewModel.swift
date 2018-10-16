//
//  ForecastViewModel.swift
//  Forecast
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ForecastViewModel: NSObject {
    
    let baseUrl = "https://samples.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22"
    
    private var responseData: ForecastModel? = nil
    
    func getAPIData(_ completion: @escaping (ForecastModel?) -> ()) {
        guard let url = URL(string: baseUrl) else { return }
        let urlRequest = URLRequest(url: url)
        ForecastAPIService.getAPIRequestMethod(urlRequest: urlRequest) { [weak self] (data, error) in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else {
                // Show Alert - Error message
                strongSelf.errorMessage = "Show Alert - Error message"
                completion(nil)
                return
            }
            guard let data = data as? ForecastModel else {
                // Show Alert - Data is nil
                strongSelf.errorMessage = "Show Alert - Data is nil"
                completion(nil)
                return
            }
            strongSelf.responseData = data
            completion(data)
        }
    }
    
    var errorMessage: String?
    
    var lists: [ForecastModel.List]? {
        return responseData?.lists
    }
    
}
