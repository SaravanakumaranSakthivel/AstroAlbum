//
//  AlbumDetailViewController.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 07/03/21.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    var viewModel:  AstroAlbumCellViewModel?
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title: "
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Captured On: "
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .bold)

        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    private let mediaTypeLabel:  UILabel = {
        let label = UILabel()
        label.text = "Media Type: "
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 13, weight: .bold)

        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        return label
    }()
    
    private let descriptionLabel :  UILabel = {
        let label = UILabel()
        label.text = "Media Type: "
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.navigationBar.isTranslucent = false;
        
        self.view.backgroundColor = .lightGray
        self.configureView()
    }
    
    
    func updateUI() {
        guard let viewModel = self.viewModel else {
            return
        }
        
        if viewModel.image == nil {
            self.activityIndicator.startAnimating()
            viewModel.downloadImage {
                DispatchQueue.main.async {
                    guard let image = viewModel.image else {
                        self.imageView.image = UIImage(named: "no_image_available")
                        self.activityIndicator.stopAnimating()
                        return
                    }
                    self.imageView.image = image
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        var mediaTypeValue = "Image"
        self.imageView.isUserInteractionEnabled = false
        if let mediaType = viewModel.mediaType,
           mediaType == .video {
            mediaTypeValue = "Video - Tap image to play video."
            self.imageView.isUserInteractionEnabled = true
        }
        
        self.mediaTypeLabel.text = String("\(self.mediaTypeLabel.text ?? "") \(mediaTypeValue)")
        self.dateLabel.text = String("\(self.dateLabel.text ?? "") \(viewModel.date ?? "")")
        self.titleLabel.text = String("\(self.titleLabel.text ?? "") \(viewModel.title ?? "" )")
        self.descriptionLabel.text = viewModel.explanation
    }
    
    @objc func onImageTap(_ sender: UITapGestureRecognizer? = nil) {
        
        guard let youtubURL = viewModel?.url else {
            return
        }
        if let url = URL(string: youtubURL) {
            UIApplication.shared.open(url)
        }
    }

    func configureView() {
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(mediaTypeLabel)
        self.view.addSubview(descriptionLabel)
        self.imageView.addSubview(activityIndicator)
        self.setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTap(_ :)))
        imageView.addGestureRecognizer(tapGesture)
        
        self.updateUI()
    }
    
    
    func setupConstraints() {
        
        activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true

        
        var allConstraints: [NSLayoutConstraint] = []
        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat:                               "V:|-10-[imageView]-[titleLabel(==40)]-[dateLabel(==20)]-[mediaTypeLabel(==20)]-[descriptionLabel(==280)]-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["imageView": self.imageView,
                                               "titleLabel": self.titleLabel,
                                               "dateLabel": self.dateLabel,
                                               "mediaTypeLabel": self.mediaTypeLabel,
                                               "descriptionLabel": self.descriptionLabel])
        allConstraints += verticalConstraint

        let horizontalConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[imageView]-30-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["imageView": self.imageView])
        allConstraints += horizontalConstraint1

        let horizontalConstraint2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[dateLabel]-20-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["dateLabel": self.dateLabel])
        allConstraints += horizontalConstraint2
        
        let horizontalConstraint3 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[mediaTypeLabel]-20-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["mediaTypeLabel": self.mediaTypeLabel])
        allConstraints += horizontalConstraint3
        
        let horizontalConstrain4 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[descriptionLabel]-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["descriptionLabel": self.descriptionLabel])
        allConstraints += horizontalConstrain4
        
        let horizontalConstrain5 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[titleLabel]-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["titleLabel": self.titleLabel])
        allConstraints += horizontalConstrain5
        
        NSLayoutConstraint.activate(allConstraints)
        
    }
}
