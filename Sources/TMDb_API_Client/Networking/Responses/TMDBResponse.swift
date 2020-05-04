//
//  TMDBResponse.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 5/3/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public protocol TMDBResponse: Decodable {
	
	var id: Int! { get }
	var overview: String? { get }
	var popularity: Double? { get }
	var backdropPath: String? { get }
	var voteAverage: Double? { get }
	var originalLanguage: String? { get }
	var voteCount: Double? { get }
	var posterPath: String? { get }
	var genreDds: [Int]? { get }
}

public struct Keywords: Decodable {
	
	public let id: Int?
	public let name: String?
}
