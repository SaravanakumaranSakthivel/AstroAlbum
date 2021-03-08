//
//  AstroAlbumHeaderViewCollectionReusableView.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 06/03/21.
//

import UIKit

class AstroAlbumHeaderView: UICollectionReusableView {
    static let identifier = "albumHeader"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Picture of the Day"
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "splashscreen.jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    func configureView() {
        addSubview(label)
        addSubview(imageView)
        addSubview(activityIndicator)
        self.bringSubviewToFront(label)
        activityIndicator.startAnimating()
        self.setupConstraints()
    }
    
    func setupConstraints() {
        
//        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        imageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10.0).isActive = true
//        imageView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: 10.0).isActive = true
//
//
//        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 30.0).isActive = true
//        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0).isActive = true
//        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20.0).isActive = true
//
//
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        
        var allConstraints: [NSLayoutConstraint] = []

        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[imageView]-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["label": self.label,
                                               "imageView": self.imageView])
        allConstraints += verticalConstraint

        let verticalConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "V:[label(==30)]-30-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["label": self.label])
        allConstraints += verticalConstraint1

        let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[label]-20-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["label": self.label])
        allConstraints += horizontalConstraint

        let horizontalConstrain2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[imageView]-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["imageView": self.imageView])
        allConstraints += horizontalConstrain2

        NSLayoutConstraint.activate(allConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = bounds
    }
    

}
