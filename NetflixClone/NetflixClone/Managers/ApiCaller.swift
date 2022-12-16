//
//  ApiCaller.swift
//  NetflixClone
//
//  Created by ntubic on 14.12.2022..
//

import Foundation

struct Constants{
    static let apiKey = "6124a33fdb00e31b4c81743fba7b17ff"
    static let baseUrl = "https://api.themoviedb.org/"
}

enum ApiError: Error {
    case failedToGetData
}

class ApiCaller{
    static let shared = ApiCaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title],Error>)-> Void){
        guard let url = URL(string:"\(Constants.baseUrl)3/trending/movie/day?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingShows(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)3/trending/tv/day?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                print(error.localizedDescription)
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
//    https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
    
    func getUpcomingMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }

    func getPopularMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }

    func getTopRated(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)3/movie/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    
//    https://api.themoviedb.org/
    func getDiscoverMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)3/discover/movie?api_key=\(Constants.apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    
    //https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
    func search(with query: String,completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return}
        
        guard let url = URL(string: "\(Constants.baseUrl)3/search/movie?api_key=\(Constants.apiKey)&query=\(query)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
}
