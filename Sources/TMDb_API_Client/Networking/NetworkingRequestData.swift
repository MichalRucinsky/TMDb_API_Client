//
//  NetworkingRequestData.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/29/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

public struct NetworkingRequestData {
    
    public let url: URL?
	public let method: HTTPMethod = .get
}

extension NetworkingRequestData {
    
    public enum HTTPMethod: String {
        case get = "GET"
    }
}
