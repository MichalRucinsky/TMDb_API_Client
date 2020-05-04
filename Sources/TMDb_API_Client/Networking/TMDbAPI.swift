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
        
        var urlComponents = URLComponents()
        urlComponents.scheme = TMDbAPI.urlScheme
        urlComponents.host = TMDbAPI.urlHost
        urlComponents.path = TMDbAPI.urlPath
        return urlComponents.url!
    }
}
