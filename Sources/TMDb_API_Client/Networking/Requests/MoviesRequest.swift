//
//  MoviesRequest.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/29/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public enum MovieQueryEndpoint: String {
	case popular
	case upcoming
	case nowPlaying = "now_playing"
	case topRated = "top_rated"
}

public struct MoviesRequest: NetworkingRequest {
    
	let endpoint: MovieQueryEndpoint
    
	public typealias ResponseType = MoviesResponse
	public var data: NetworkingRequestData {
		return NetworkingRequestData(url: TMDbServices.movies(endpoint.rawValue).url)
    }
	
	public init (endpoint: MovieQueryEndpoint) {
		self.endpoint = endpoint
	}
}
