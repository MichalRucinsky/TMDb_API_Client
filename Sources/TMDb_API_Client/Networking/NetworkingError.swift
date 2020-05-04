//
//  NetworkingError.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/29/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public enum NetworkingError: Error {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .apiError: return "Ooops, there is a problem with the api"
        case .invalidEndpoint: return "Ooops, there is a problem with the endpoint"
        case .invalidResponse: return "Ooops, there is a problem with the response"
        case .noData: return "Ooops, there is a problem with the data"
        case .serializationError: return "Ooops, there is a problem with the serialization process"
        }
    }
}
