import Alamofire
import Foundation

enum NetworkError: Error {
    case server(String)
    case decodingError(String)
}

enum County {
    case ru
    case us
}

final class NetworkService {
    private let decoder = JSONDecoder()
    
    func fetchInitialNews(
        county: County,
        completion: @escaping (Result<NewsModel, NetworkError>) -> Void
    ) {
        let urlStr = "https://newsapi.org/v2/top-headlines?country=\(county)&apiKey=78dfd55579cc4b91ad6729d4f16e9a76"
        
        AF.request(
            urlStr,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil
        ).response {
            switch $0.result {
            case .success(let data):
                do {
                    let news = try self.decoder.decode(NewsModel.self, from: data!)
                    completion(.success(news))
                } catch let decodingError {
                    let errorDescription = "Decoding error: \(decodingError.localizedDescription)"
                    completion(.failure(.decodingError(errorDescription)))
                }
                
            case .failure(let error):
                // TODO: handle error
                let errorDescription = "Network error: \(error.localizedDescription)"
                print(errorDescription)
                completion(.failure(.server(errorDescription)))
            }
        }
    }
    
    func fetchNewsBy(
        category: String,
        completion: @escaping (Result<NewsModel, NetworkError>) -> Void
    ) {
        let urlStr = "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=78dfd55579cc4b91ad6729d4f16e9a76"
        
        AF.request(
            urlStr,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil
        ).response {
            switch $0.result {
            case .success(let data):
                do {
                    let news = try self.decoder.decode(NewsModel.self, from: data!)
                    completion(.success(news))
                } catch let decodingError {
                    let errorDescription = "Decoding error: \(decodingError.localizedDescription)"
                    completion(.failure(.decodingError(errorDescription)))
                }
                
            case .failure(let error):
                // TODO: handle error
                let errorDescription = "Network error: \(error.localizedDescription)"
                print(errorDescription)
                completion(.failure(.server(errorDescription)))
            }
        }
    }
}
