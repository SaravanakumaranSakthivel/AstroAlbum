//
//  ViewController.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 06/03/21.
//

import UIKit

class AlbumViewController: UIViewController {
    


    weak var collectionView: UICollectionView!
    var data: [Int] = Array(0..<10)

    override func loadView() {
        super.loadView()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 2,
                                           left: 2,
                                           bottom: 2,
                                           right: 2)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2.1,
                                 height: self.view.frame.size.width/2.1)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        self.collectionView = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
        
        // Register Collection view cell
        self.collectionView.register(AstroAlbumCell.self, forCellWithReuseIdentifier: AstroAlbumCell.identifier)

        // Register Collection view header to display picture of the day
        self.collectionView.register(AstroAlbumHeaderView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: AstroAlbumHeaderView.identifier)
        
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
}


extension AlbumViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AstroAlbumCell.identifier, for: indexPath) as? AstroAlbumCell else {
            fatalError("Unable to load Astro album cell")
        }
        cell.configureView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                           withReuseIdentifier: AstroAlbumHeaderView.identifier,
                                                                           for: indexPath) as? AstroAlbumHeaderView else {
            fatalError("No Astro Album header view found")
        }
        header.configureView()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(AlbumDetailViewController(), animated: true)
    }
}


extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,
                      height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2.2,
                      height: collectionView.bounds.width / 2.2)
        
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2,
                            left: 5,
                            bottom: 2,
                            right: 5)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
        
}
