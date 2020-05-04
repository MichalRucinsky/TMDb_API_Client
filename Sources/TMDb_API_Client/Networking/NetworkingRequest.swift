//
//  NetworkingRequest.swift
//  TMDb-Storyboard-MVVM+C
//
//  Created by Mikael Rucinsky on 4/29/20.
//  Copyright © 2020 Mikael Rucinsky. All rights reserved.
//

import Foundation

private var decoder: JSONDecoder = {
	let decoder = JSONDecoder()
	decoder.keyDecodingStrategy = .convertFromSnakeCase
	let dateFormatter = DateFormatter()
	dateFormatter.dateFormat = "yyyy-mm-dd"
	decoder.dateDecodingStrategy = .formatted(dateFormatter)
	return decoder
}()

private var session: URLSession = {
	let config = URLSessionConfiguration.default
	config.urlCache = URLCache.shared
	config.waitsForConnectivity = true
	config.requestCachePolicy = .returnCacheDataElseLoad
	return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
}()

public protocol NetworkingRequestBase: Any {}

public protocol NetworkingRequest: NetworkingRequestBase {
	
    associatedtype ResponseType: Decodable
	var data: NetworkingRequestData { get }
}

public extension NetworkingRequest {
    
    func parse(_ data: Data) -> ResponseType? {
        do {
            let model: ResponseType = try decoder.decode(ResponseType.self, from: data)
            return model
        } catch _ {
            return nil
        }
    }
    
	func execute(completion: @escaping (Result<ResponseType, NetworkingError>) -> Void) {
        
        let request = self.data
        
        guard let url = request.url else {
            return completion(.failure(.invalidEndpoint))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
		let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                return completion(.failure(.apiError))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.noData))
            }
			
			if let model = self.parse(data) {
				DispatchQueue.main.async {
					completion(.success(model))
				}
			}
			else {
				DispatchQueue.main.async {
					completion(.failure(.serializationError))
				}
			}
        }
        
        task.resume()
    }
}
