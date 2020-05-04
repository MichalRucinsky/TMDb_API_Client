//
//  MovieDetail.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 5/3/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public struct MovieDetail: TMDBResponse {
	
	public let overview: String?
	public let popularity: Double?
	public let id: Int!
	public let backdropPath: String?
	public let voteAverage: Double?
	public let originalLanguage: String?
	public let voteCount: Double?
	public let posterPath: String?
	public let genreDds: [Int]?
	
	public var belongsToCollection: BelongsToCollectionMovie?
	public var budget: Int?
	public var homepage: String?
	public var imdbId: Int!
	public var productionCompanies: [Keywords]?
	public var productionCountries: [Keywords]?
	public var revenue : Int?
	public var runtime: Int?
	public var spokenLanguages: [SpokenLanguages]?
	public var status: String!
	public var tagline: String!
}

public struct BelongsToCollectionMovie: Decodable {
	public var id: Int!
	public var name: String!
	public var posterPath: String!
	public var backdropPath: String!
}

public struct SpokenLanguages: Decodable {
	public var iso_639_1: String!
	public var name: String!
}
