//
//  TVShowsRequest.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/30/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public enum TVQueryEndpoint: String {
	case popular
	case latest
	case topRated = "top_rated"
	case airingToday = "airing_today"
	case onTheAir = "on_the_air"
}

public struct TVShowsRequest<T: Decodable>: NetworkingRequest {
    
	let endpoint: TVQueryEndpoint
    
	public typealias ResponseType = T
	public var data: NetworkingRequestData {
		return NetworkingRequestData(url: TMDbServices.tvShows(endpoint.rawValue).url)
    }
	
	public init (endpoint: TVQueryEndpoint) {
		self.endpoint = endpoint
	}
}

