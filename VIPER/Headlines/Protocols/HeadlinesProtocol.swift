//
//  HeadlinesProtocol.swift
//  VIPER
//
//  Created by Pratik on 18/06/22.
//

import Foundation
import UIKit

// VIEW -> PRESENTER

protocol HeadlinesPresenterProtocol: AnyObject {
    var interactor: HeadlinesInteractorInputProtocol? { get set }
    var view: HeadlinesViewProtocol? { get set }
    var router: HeadlinesRouterProtocol? { get set }

    func updateHeadlines()
    func getHeadlineCount() -> Int?
    func getHeadlines(index: Int) -> HeadlinesModel?
    func showNewsDetail(_ news: HeadlinesModel?, view: UIViewController)
}

// PRESENTER -> INTERACTOR

protocol HeadlinesInteractorInputProtocol: AnyObject {
    var presenter: HeadlinesInteractorOutputProtocol? { get set }
    var headlines: [HeadlinesModel]? { get }
    func fetchHeadlines()
}

// INTERACTOR -> PRESENTER

protocol HeadlinesInteractorOutputProtocol: AnyObject {
    func headlinesDidFetch()
    func headlinesFetchFailed(error: String?)
    func getView() -> UIView?
}

// PRESENTER -> VIEW

protocol HeadlinesViewProtocol: AnyObject {
    func showHeadlines()
    func showError(error: String?)
}

// PRESENTER -> ROUTER

protocol HeadlinesRouterProtocol: AnyObject {
    static func createModule(view: HeadlinesVC)
    func pushToNewsDetail(_ news: HeadlinesModel?, view: UIViewController)
}
