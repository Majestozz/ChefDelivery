//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Alisson Inácio on 01/04/24.
//

import Foundation
import Alamofire

enum RequestErrors: Error {
    case invalidUrl
    case errorRequest(error: String)
}

struct HomeService{
    func fetchData() async throws -> Result<[StoreType], RequestErrors>{
        guard let url = URL(string: "https://private-62fd0d-majestozz.apiary-mock.com/home") else{
            return .failure(.invalidUrl)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let(data, _) = try await URLSession.shared.data(for: request)
        let storesObject = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObject)
    }
    
    func confirmOrder(product:ProductType) async throws -> Result<[String: Any]?, RequestErrors> {
        guard let url = URL(string: "https://private-62fd0d-majestozz.apiary-mock.com/home") else{
            return .failure(.invalidUrl)
        }
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let(data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        return .success(message)
    }
    
    func fetchDataWithAlamofire(completion: @escaping([StoreType]?, Error?) -> Void){
        AF.request("https://private-62fd0d-majestozz.apiary-mock.com/home").responseDecodable(of: [StoreType].self){
            response in
            switch response.result{
            case .success(let stores):
                completion(stores, nil)
            default: break
            }
        }
    }
}
