//
//  ForecastModel.swift
//  Forecast
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

struct ForecastModel: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case statusCode = "cod"
        case message
        case numberOfContent = "cnt"
        case lists = "list"
        case city
    }
    
    let statusCode: String?
    let message: Double?
    let numberOfContent: Int?
    let lists: [List]?
    let city: City?
    
    struct List: Codable {
        
        private enum CodingKeys: String, CodingKey {
            case dt
            case main
            case weather
            case wind
            case dt_txt
        }
        
        let dt: Double?
        let main: Main?
        let weather: [Weather]?
        let wind: Wind?
        let dt_txt: String?
        
        struct Main: Codable {
            
            private enum CodingKeys: String, CodingKey {
                case temp
                case temp_min
                case temp_max
                case humidity
            }
            
            let temp: Double?
            let temp_min: Double?
            let temp_max: Double?
            let humidity: Double?
            
        }
        
        struct Weather: Codable {
            
            private enum CodingKeys: String, CodingKey {
                case weatherID = "id"
                case main
                case description
                case icon
            }
            
            let weatherID: Double?
            let main: String?
            let description: String?
            let icon: String?
        }
        
        struct Wind: Codable {
            
            private enum CodingKeys: String, CodingKey {
                case windSpeed = "speed"
                case degree = "deg"
            }
            
            let windSpeed: Double?
            let degree: Double?
        }
        
    }
    
    struct City: Codable {
        
        private enum CodingKeys: String, CodingKey {
            case cityID = "id"
            case name
            case coord
            case country
        }
        
        let cityID: Double?
        let name: String?
        let coord: Coord?
        let country: String?
        
        struct Coord: Codable {
            
            private enum CodingKeys: String, CodingKey {
                case lat
                case lon
            }
            
            let lat: Double?
            let lon: Double?
            
        }
    }
}
