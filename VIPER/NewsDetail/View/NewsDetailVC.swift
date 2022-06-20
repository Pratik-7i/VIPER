//
//  NewsDetailVC.swift
//  VIPER
//
//  Created by Pratik on 19/06/22.
//

import UIKit

class NewsDetailVC: UIViewController
{
    @IBOutlet var containerView : UIView!
    @IBOutlet var newsImgView   : UIImageView!
    @IBOutlet var titleLabel    : UILabel!
    @IBOutlet var authorLabel   : UILabel!
    @IBOutlet var descLabel     : UILabel!
    @IBOutlet var errorLabel    : UILabel!
    
    var presenter: NewsDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.requestNewsDetails()
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.presenter?.backButtonTapped(from: self)
    }
    func updateUI(isError: Bool, errorMessage: String? = "") {
        self.containerView.isHidden = isError
        self.errorLabel.isHidden = !isError
        self.errorLabel.text = errorMessage
    }
}

extension NewsDetailVC: NewsDetailViewProtocol {
    
    func showNewsDetail(news: HeadlinesModel) {
        self.updateUI(isError: false)
        self.newsImgView.setImage(news.urlToImage)
        self.titleLabel.text = news.title
        self.authorLabel.text = news.author
        self.descLabel.text = news.description
    }
    func showError(error: String?) {
        self.updateUI(isError: true, errorMessage: error)
    }
}
