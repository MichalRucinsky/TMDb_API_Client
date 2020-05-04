//
//  TVShowDetail.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 5/1/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public struct TVShowDetail: Decodable {
	
	public let createdBy: TVShowCreatedBy?
	public let episodeRunTime: [Int]?
	public let homepage: String?
	public let inProduction: Bool?
	public let languages: [String]?
	public let lastAirDate: String?
	public let networks: [Keywords]?
	public let numberOfEpisodes: Int?
	public let numberOfSeasons: Int?
	public let productionCompanies: [Keywords]?
	public let seasons: [TVSeasons]?
	public let status: String?
	public let type: String?
	public let nextEpisodeToAir: TVEpisodes?
	public let lastEpisodeToAir: TVEpisodes?
}

public struct TVShowCreatedBy: Decodable {
	public let id: Int!
	public let name: String!
	public let profilePath: String!
}

public struct TVSeasons: Decodable {
	public let airDate: String?
	public let episodeCount: Int!
	public let id: Int!
	public let posterPath: String!
	public let seasonNumber: Int!
}

public struct TVEpisodes: Decodable {
	
	public let airDate: String!
	public let crew: [Crew]?
	public let guestStars: [TVCast]?
	public let number: Int!
	public let name: String!
	public let overview: String!
	public let id: Int!
	public let productionCode: Int!
	public let seasonNumber: Int!
	public let stillPath: String!
	public let voteAverage: Int!
	public let voteCount: Int!
}

public struct Crew: Decodable {
	
	public let creditId: String!
	public let id: Int!
	public let name: String!
	public let profilePath: String?
	public let department: String!
	public let job: String!
}

public struct TVCast: Decodable {
	
	public let creditId: String!
	public let id: Int!
	public let name: String!
	public let profilePath: String?
	public let department: String!
	public let job: String!
	public let character: String!
	public let order: Int!
}

