//
//  APIManager.swift
//  VIPER
//
//  Created by Pratik on 19/06/22.
//

import UIKit

enum FetchError: Error
{
    case invalidURL
    case noResponse
    case noData
}

extension FetchError: LocalizedError
{
    var errorDescription: String?
    {
        switch self
        {
        case .invalidURL:
            return NSLocalizedString("invalid_url", comment: "Invalid URL")
            
        case .noResponse:
            return NSLocalizedString("no_response", comment: "No Response")
            
        case .noData:
            return NSLocalizedString("no_data", comment: "No Data")
        }
    }
}

class WebServiceManager: NSObject
{
    static let shared = WebServiceManager()
    typealias WebServiceCompletionBlock = (_ data: Data?, _ error: Error?) -> Void
    
    func requestAPI(_ url: String, view: UIView? = nil, completion: @escaping WebServiceCompletionBlock)
    {
        guard let url = URL(string: url) else {
            completion(nil, FetchError.invalidURL)
            return
        }
        if let view = view {
            view.addActivityIndicator(Message.activity)
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                if let view = view {
                    view.removeActivityIndicator()
                }
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard response != nil else {
                    completion(nil, FetchError.noResponse)
                    return
                }
                guard let data = data else {
                    completion(nil, FetchError.noData)
                    return
                }
                completion(data, nil)
            }
        }
        task.resume()
    }
}
