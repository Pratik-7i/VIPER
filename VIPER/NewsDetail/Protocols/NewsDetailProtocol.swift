//
//  HeadlinesProtocol.swift
//  VIPER
//
//  Created by Pratik on 18/06/22.
//

import Foundation
import UIKit

// VIEW -> PRESENTER

protocol NewsDetailPresenterProtocol: AnyObject {
    
    var view: NewsDetailViewProtocol? { get set }
    var router: NewsDetailRouterProtocol? { get set }
    var news: HeadlinesModel? { get set }
    
    func requestNewsDetails()
    func backButtonTapped(from view: UIViewController)
}

// PRESENTER -> VIEW

protocol NewsDetailViewProtocol: AnyObject {
    func showNewsDetail(news: HeadlinesModel)
    func showError(error: String?)
}

// PRESENTER -> ROUTER

protocol NewsDetailRouterProtocol: AnyObject {
    func goBackToHeadlinesView(from view: UIViewController)
}
