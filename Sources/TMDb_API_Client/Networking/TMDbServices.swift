//
//  TMDbServices.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/29/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public enum TMDbServices {
    case movies(String)
	case movieDetail(String)
    case tvShows(String)
    
    public var url: URL? {
		
		guard let apikey = TMDb_API_Client.apikey else {
			fatalError("NO API is set. Set your api using TMDb_API_Client.apikey = YOURKEY")
		}
		
        var last = ""
        
        switch self {
        case .movies(let movieEndpoints):
            last = "/movie/" + movieEndpoints
            break
		case .movieDetail(let ident):
			last = "/movie/" + ident
			break
        case .tvShows(let tvEndpoints):
            last = "/tv/" + tvEndpoints
            break
        }
        
        let componentUrl = TMDbAPI().makeURL().appendingPathComponent(last)
        guard var urlComponents = URLComponents(url: componentUrl, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
		let queryItems = [URLQueryItem(name: "api_key", value: apikey)]
        urlComponents.queryItems = queryItems
        
        //generate valid url
        guard let url = urlComponents.url else {
            return nil
        }
        return url
    }
}
