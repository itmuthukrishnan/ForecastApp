//
//  ForecastDayCellViewModel.swift
//  Forecast
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ForecastDayCellViewModel: NSObject {
    
    let imageBaseUrl = "http://openweathermap.org/img/w/%@.png"
    
    var list: ForecastModel.List? = nil
    
    var dayText: String {
        return "\(list?.dt_txt ?? "")"
    }
    
    var descriptionText: String {
        return "\(list?.weather?.first?.description ?? "")"
    }
    
    var tempText: String {
        return "\(list?.main?.temp ?? 0)"
    }
    
    var windSpeedText: String {
        return "\(list?.wind?.windSpeed ?? 0)"
    }
    
    var humidityText: String {
        return "\(list?.main?.humidity ?? 0)"
    }
    
    var weatherImageURLString: String? {
        guard let icon = list?.weather?.first?.icon else {
            return ""
        }
        return imageBaseUrl.replacingOccurrences(of: "%@", with: icon)
    }
    
}

extension UIImageView {
    
    func setImage(_ urlString: String?) {
        guard let imgUrlString = urlString, let url = URL.init(string: imgUrlString) else {
            return
        }
        DispatchQueue.global().async {
            if let imageData = NSData.init(contentsOf: url) as Data? {
                DispatchQueue.main.async {
                    self.image = UIImage.init(data: imageData)
                }
            }
        }
    }
    
}
