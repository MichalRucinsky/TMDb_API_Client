//
//  TMDbAPI.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/29/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

struct TMDbAPI {
    
    static let urlScheme = "https"
    static let urlHost = "api.themoviedb.org"
    static let urlPath = "/3"
}

extension TMDbAPI {
    
    func makeURL() -> URL {
        
		guard let apikey = TMDb_API_Client.apikey else {
			fatalError("NO API is set. Set your api using TMDb_API_Client.apikey = YOURKEY")
		}
		
        var urlComponents = URLComponents()
        urlComponents.scheme = TMDbAPI.urlScheme
        urlComponents.host = TMDbAPI.urlHost
        urlComponents.path = TMDbAPI.urlPath
		
		let queryItems = [URLQueryItem(name: "api_key", value: apikey)]
		urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
