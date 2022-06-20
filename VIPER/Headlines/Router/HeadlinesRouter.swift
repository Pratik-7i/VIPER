//
//  HeadlinesRouter.swift
//  VIPER
//
//  Created by Pratik on 18/06/22.
//

import Foundation
import UIKit

class HeadlinesRouter: HeadlinesRouterProtocol
{
    class func createModule(view: HeadlinesVC) {
        let presenter: HeadlinesPresenterProtocol & HeadlinesInteractorOutputProtocol = HeadlinesPresenter()
        let interactor: HeadlinesInteractorInputProtocol = HeadlinesInteractor()
        let router: HeadlinesRouterProtocol = HeadlinesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    func pushToNewsDetail(_ news: HeadlinesModel?, view: UIViewController) {
        let newsDetailVC = view.storyboard?.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        NewsDetailRouter.createModule(view: newsDetailVC, news: news)
        view.navigationController?.pushViewController(newsDetailVC, animated: true)
    }
}
