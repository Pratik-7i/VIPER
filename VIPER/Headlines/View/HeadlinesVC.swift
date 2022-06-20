//
//  HeadlinesVC.swift
//  VIPER
//
//  Created by Pratik on 18/06/22.
//

import UIKit

class HeadlinesVC: UIViewController
{
    @IBOutlet var errorView          : UIView!
    @IBOutlet var errorLabel         : UILabel!
    @IBOutlet var headlinesTableView : UITableView!

    var presenter: HeadlinesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Headlines"
        HeadlinesRouter.createModule(view: self)
        self.presenter?.updateHeadlines()
    }
    @IBAction func retryButtonTapped(_ sender: UIButton) {
        self.presenter?.updateHeadlines()
    }
    func updateUI(isError: Bool, errorMessage: String? = "") {
        self.headlinesTableView.isHidden = isError
        self.errorView.isHidden = !isError
        self.errorLabel.text = errorMessage
    }
}

extension HeadlinesVC: HeadlinesViewProtocol {
    
    func showHeadlines() {
        self.updateUI(isError: false)
        self.headlinesTableView.reloadData()
    }
    func showError(error: String?) {
        self.updateUI(isError: true, errorMessage: error)
    }
}

extension HeadlinesVC: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getHeadlineCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlineCell", for: indexPath) as! HeadlineCell
        if let headline = self.presenter?.getHeadlines(index: indexPath.row) { cell.load(headline) }
        return cell
    }
}

extension HeadlinesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showNewsDetail(self.presenter?.getHeadlines(index: indexPath.row), view: self)
    }
}
