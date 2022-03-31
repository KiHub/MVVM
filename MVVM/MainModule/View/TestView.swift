//
//  TestView.swift
//  MVVM
//
//  Created by  Mr.Ki on 31.03.2022.
//

import UIKit

class TestView: UIView {
    
    var viewData: ViewData = .initial {
        //call rewrite view
        didSet {
            setNeedsLayout()
        }
    }

    lazy var imageView  = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLable = makeTitleLabel()
    lazy var descriptionlabel = makeDescriptionLabel()
    
    //rewrite view
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHiden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .loading(let loading):
            update(viewData: loading, isHiden: false)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .success(let success):
            update(viewData: success, isHiden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .failure(let failure):
            update(viewData: failure, isHiden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
        
    }
    
    private func update(viewData: ViewData.Data?, isHiden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "")
        titleLable.text = viewData?.title
        descriptionlabel.text = viewData?.description
        titleLable.isHidden = isHiden
        descriptionlabel.isHidden = isHiden
        imageView.isHidden = isHiden
    }

}
