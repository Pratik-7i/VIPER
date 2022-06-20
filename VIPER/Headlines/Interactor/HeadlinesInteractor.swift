//
//  HeadlinesInteractor.swift
//  VIPER
//
//  Created by Pratik on 18/06/22.
//

import Foundation

class HeadlinesInteractor {
    weak var presenter: HeadlinesInteractorOutputProtocol?
    var headlines: [HeadlinesModel]?
}

extension HeadlinesInteractor: HeadlinesInteractorInputProtocol {
    
    func fetchHeadlines()
    {
        let view = self.presenter?.getView()
        
        WSManager.requestAPI(API.getHeadlines, view: view) { data, error in
            if let fetchError = error {
                self.presenter?.headlinesFetchFailed(error: fetchError.localizedDescription)
                return
            }
            do {
                let newsResponse = try JSONDecoder().decode(ResponseModel.self, from: data!)
                guard let articles = newsResponse.articles else {
                    self.presenter?.headlinesFetchFailed(error: "No headline found from the server")
                    return
                }
                self.headlines = articles
                self.presenter?.headlinesDidFetch()
            } catch let error {
                self.presenter?.headlinesFetchFailed(error: error.localizedDescription)
            }
        }
    }
}
