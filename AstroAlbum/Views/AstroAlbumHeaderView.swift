//
//  AstroAlbumHeaderViewCollectionReusableView.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 06/03/21.
//

import UIKit

class AstroAlbumHeaderView: UICollectionReusableView {
    static let identifier = "albumHeader"
    
    private let contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Tap to load last 10 days media", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private let slider: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.value = 100
        slider.isContinuous = true
        slider.tintColor = .green
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 150
        slider.value = 10
        slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)

        return slider
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Note: By default, Displaying last 10 days astronomy medias\n Min value - 1 & Max Value - 200"
        label.font = .italicSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    private let filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter Media type"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedItems = ["All", "Image", "Video"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .green
        return segmentedControl
    }()

    
    func configureView() {
        addSubview(contentView)
        self.contentView.addSubview(button)
        self.contentView.addSubview(slider)
        self.contentView.addSubview(noteLabel)
        self.contentView.addSubview(filterLabel)
        self.contentView.addSubview(segmentedControl)
        self.backgroundColor = .white
        
        self.setupConstraints()
    }
    
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
             // First segment tapped
          break
          case 1:
             // Second segment tapped
            break
          case 2:
          // Second segment tapped
          break
          default:
          break
       }
    }

    @objc func sliderValueDidChange(_ slider: UISlider) {
        let buttonTitle = "Tap to load last \(Int(slider.value)) days media"
        self.button.setTitle(buttonTitle, for: .normal)
    }
    
    
    func setupConstraints() {
        
        contentView.topAnchor.constraint(equalTo: self.topAnchor,constant: 20.0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20.0).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20.0).isActive = true

        var allConstraints: [NSLayoutConstraint] = []
        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat:                               "V:|-[button(==40)]-[slider(==30)]-[noteLabel(==40)]-[filterLabel(==30)]-10-[segmentedControl(==30)]",
                                       options: [],
                                       metrics: nil,
                                       views: ["button": self.button,
                                               "slider": self.slider,
                                               "noteLabel": self.noteLabel,
                                               "filterLabel": self.filterLabel,
                                               "segmentedControl": self.segmentedControl])
        allConstraints += verticalConstraint

        let horizontalConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[button]-30-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["button": self.button])
        allConstraints += horizontalConstraint1

        let horizontalConstraint2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[slider]-20-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["slider": self.slider])
        allConstraints += horizontalConstraint2
        
        let horizontalConstraint3 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[filterLabel]-20-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["filterLabel": self.filterLabel])
        allConstraints += horizontalConstraint3
        
        let horizontalConstrain4 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[segmentedControl]-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["segmentedControl": self.segmentedControl])
        allConstraints += horizontalConstrain4
        
        let horizontalConstrain5 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[noteLabel]-20-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["noteLabel": self.noteLabel])
        allConstraints += horizontalConstrain5

        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = bounds
    }
    

}
