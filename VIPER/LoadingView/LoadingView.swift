//
//  LoadingView.swift
//  VIPER
//
//  Created by Pratik on 19/06/22.
//

import UIKit

fileprivate let viewLoader = UIView()

class LoadingView: UIView
{
    @IBOutlet weak var contentView     : UIView!
    @IBOutlet weak var viewBG          : UIView!
    @IBOutlet weak var viewTransparent : UIView!
    @IBOutlet weak var activityView    : UIActivityIndicatorView!
    @IBOutlet weak var lblActivity     : UILabel!
    
    /* For using view through code */
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    convenience init(frame: CGRect, activity: String) {
        self.init(frame: frame) 
        self.lblActivity.text = activity
    }
    
    /* For using view through IBOutlet */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: LoadingView.self), owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        setupControls()
    }
    
    private func setupControls() {
        self.viewBG.layer.cornerRadius = 7
        self.lblActivity.text = "Please wait..."
    }
}
