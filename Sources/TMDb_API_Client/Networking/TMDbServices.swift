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
        return TMDbAPI().makeURL().appendingPathComponent(last)
    }
}
