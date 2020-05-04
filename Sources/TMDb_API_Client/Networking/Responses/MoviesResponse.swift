//
//  MoviesResponse.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/29/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public struct MoviesResponse: Decodable {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [Movie]
}

public struct Movie: TMDBResponse, Hashable {
		    
	public let overview: String?
	public let popularity: Double?
	public let id: Int!
	public let backdropPath: String?
	public let voteAverage: Double?
	public let originalLanguage: String?
	public let voteCount: Double?
	public let posterPath: String?
	public let genreDds: [Int]?
	
	public let title: String?
	public let video: Bool?
	public let adult: Bool?
	public let releaseDate: String?
	public let originalTitle: String?
	public let genreIds: [Int]?
	
    public let tagline: String?
    public let genres: [MovieGenre]?
    public let videos: MovieVideoResponse?
    public let credits: MovieCreditResponse?
    public let runtime: Int?
	
	public var posterURL: URL {
		return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
	}
	
	public var backdropURL: URL {
		return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
	}
	
    public var voteAveragePercentText: String {
		return "\(Int(voteAverage ?? 0 * 10))%"
    }
	
	public static func == (lhs: Movie, rhs: Movie) -> Bool {
		lhs.id == rhs.id
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

public struct MovieGenre: Decodable {
    public let name: String
}

public struct MovieVideoResponse: Decodable {
    public let results: [MovieVideo]
}

public struct MovieVideo: Decodable {
    public let id: String
    public let key: String
    public let name: String
    public let site: String
    public let size: Int
    public let type: String
    
    public var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://www.youtube.com/watch?v=\(key)")
    }
}

public struct MovieCreditResponse: Decodable {
    public let cast: [MovieCast]
    public let crew: [MovieCrew]
}

public struct MovieCast: Decodable {
    public let character: String
    public let name: String
}

public struct MovieCrew: Decodable {
    public let id: Int
    public let department: String
    public let job: String
    public let name: String
}
