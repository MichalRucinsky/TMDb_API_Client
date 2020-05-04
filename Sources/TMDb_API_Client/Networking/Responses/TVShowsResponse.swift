//
//  TVShowsResponse.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/30/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public struct TVShowsResponse: Decodable {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [TVShow]
}

public struct TVShow: TMDBResponse, Hashable {
	
	public let overview: String?
	public let popularity: Double?
	public let id: Int!
	public let backdropPath: String?
	public let voteAverage: Double?
	public let originalLanguage: String?
	public let voteCount: Double?
	public let posterPath: String?
	public let genreDds: [Int]?
	
	public var name: String?
	
	public var posterURL: URL {
		return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
	}
	
	public var backdropURL: URL {
		return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
	}
	
	public static func == (lhs: TVShow, rhs: TVShow) -> Bool {
		lhs.id == rhs.id
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
