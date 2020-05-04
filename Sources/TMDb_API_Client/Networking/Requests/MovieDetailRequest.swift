//
//  MovieDetailRequest.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 5/3/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public struct MovieDetailRequest: NetworkingRequest {
	
	let ident: String
	
	public typealias ResponseType = MovieDetail
	public var data: NetworkingRequestData {
		return NetworkingRequestData(url: TMDbServices.movieDetail(ident).url)
	}
}
