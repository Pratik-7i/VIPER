//
//  HeadlinesPresenter.swift
//  VIPER
//
//  Created by Pratik on 18/06/22.
//

import Foundation
import UIKit

class HeadlinesPresenter {
    var interactor: HeadlinesInteractorInputProtocol?
    weak var view: HeadlinesViewProtocol?
    var router: HeadlinesRouterProtocol?
}

extension HeadlinesPresenter: HeadlinesPresenterProtocol {

    func updateHeadlines() {
        self.interactor?.fetchHeadlines()
    }
    func getHeadlineCount() -> Int? {
        return self.interactor?.headlines?.count
    }
    func getHeadlines(index: Int) -> HeadlinesModel? {
        return self.interactor?.headlines?[index]
    }
    func showNewsDetail(_ news: HeadlinesModel?, view: UIViewController) {
        self.router?.pushToNewsDetail(news, view: view)
    }
}

extension HeadlinesPresenter: HeadlinesInteractorOutputProtocol {
    
    func headlinesDidFetch() {
        self.view?.showHeadlines()
    }
    func headlinesFetchFailed(error: String?) {
        self.view?.showError(error: error)
    }
    func getView() -> UIView? {
        guard let viewController = self.view as? UIViewController else { return nil }
        return viewController.view
    }
}
