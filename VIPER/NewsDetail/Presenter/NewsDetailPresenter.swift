//
//  NewsDetailPresenter.swift
//  VIPER
//
//  Created by Pratik on 20/06/22.
//

import Foundation
import UIKit

class NewsDetailPresenter {
    weak var view: NewsDetailViewProtocol?
    var router: NewsDetailRouterProtocol?
    var news: HeadlinesModel?
}

extension NewsDetailPresenter: NewsDetailPresenterProtocol {
    
    func requestNewsDetails() {
        if let news = self.news {
            self.view?.showNewsDetail(news: news)
        } else {
            self.view?.showError(error: Message.noNewsDetail)
        }
    }
    func backButtonTapped(from view: UIViewController) {
        self.router?.goBackToHeadlinesView(from: view)
    }
}
