//
//  HeadlineCell.swift
//  VIPER
//
//  Created by Pratik on 19/06/22.
//

import UIKit

class HeadlineCell: UITableViewCell
{
    @IBOutlet weak var headlineLable : UILabel!
    @IBOutlet weak var headlineImgView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func load(_ headline: HeadlinesModel) {
        self.headlineLable.text = headline.title
        self.headlineImgView.setImage(headline.urlToImage)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
