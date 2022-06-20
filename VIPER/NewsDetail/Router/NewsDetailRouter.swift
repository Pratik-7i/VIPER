//
//  HeadlinesRouter.swift
//  VIPER
//
//  Created by Pratik on 18/06/22.
//

import Foundation
import UIKit

class NewsDetailRouter: NewsDetailRouterProtocol
{
    class func createModule(view: NewsDetailVC, news: HeadlinesModel?) {
        let presenter: NewsDetailPresenterProtocol = NewsDetailPresenter()
        let router: NewsDetailRouterProtocol = NewsDetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.news = news
    }
    
    func goBackToHeadlinesView(from view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }
}
