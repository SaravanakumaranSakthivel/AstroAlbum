//
//  AstroAlbumCell.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 06/03/21.
//

import UIKit

class AstroAlbumCell: UICollectionViewCell {
    static let identifier = "albumidentifier"
    
    var cellVModal : AstroAlbumCellViewModel? {
        didSet {
            self.updateUI()
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Picture of the DayPicture of the DayPicture of the DayPicture of the DayPicture of the Day"
        label.textAlignment = .justified
        label.numberOfLines = 2
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        activityIndicator.color = .darkGray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.reset()
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func reset() {
        self.label.textAlignment = .left
        self.imageView.image = nil
    }
    
    func configureView() {
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.addSubview(activityIndicator)
        contentView.bringSubviewToFront(label)
        imageView.image = UIImage(named: "no_image_available")
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true

        activityIndicator.startAnimating()
        self.setupConstraints()
    }
    
    func updateUI() {
        self.label.text = self.cellVModal?.title
        
        self.activityIndicator.startAnimating()
        
        if self.cellVModal?.image == nil {
            self.cellVModal?.downloadImage {
                DispatchQueue.main.async {
                    guard let image = self.cellVModal?.image else {
                        self.imageView.image = UIImage(named: "no_image_available")
                        self.activityIndicator.stopAnimating()
                        return
                    }
                    self.imageView.image = image
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = bounds
    }
    
    func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        

        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0.0).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
}

