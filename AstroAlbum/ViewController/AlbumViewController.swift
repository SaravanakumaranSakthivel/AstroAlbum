//
//  ViewController.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 06/03/21.
//

import UIKit

class AlbumViewController: UIViewController {
    

    var networkIndicator : NetworkActivityIndicator!
    weak var collectionView: UICollectionView!
    var data = [AstroAlbumModel]()
    var dataSource = [AstroAlbumModel]()

    override func loadView() {
        super.loadView()
        
        self.navigationController?.navigationBar.barTintColor = .green
        self.navigationController?.hidesBarsOnSwipe = true
        self.title = "Astronomy Album"
        
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
        self.view.backgroundColor = .clear
        self.view.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .clear
        
        // Register Collection view cell
        self.collectionView.register(AstroAlbumCell.self, forCellWithReuseIdentifier: AstroAlbumCell.identifier)

        // Register Collection view header to display picture of the day
        self.collectionView.register(AstroAlbumHeaderView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: AstroAlbumHeaderView.identifier)
        
        
        networkIndicator = NetworkActivityIndicator(title: nil, message: "Please wait...", preferredStyle: .alert)
        self.present(self.networkIndicator, animated: false, completion: nil)
        
        //Call APOD service and collect last 30 days data
        self.getAstroAlbumData(numberOfDays: -30)
    }
    
    func getAstroAlbumData(numberOfDays: Int) {
        
        let date = Date()
        let currentDate = date.getFormattedDate(format: "yyyy-MM-dd")
        
        let fromDate = Calendar.current.date(byAdding: .day , value: numberOfDays , to: date)
        guard let formattedFromDate = fromDate?.getFormattedDate(format: "yyyy-MM-dd") else { return }
        
        NetworkHelper.getAstroAlbumForTheDateRange(startDate: formattedFromDate,
                                                   endDate: currentDate, handler: { response, error in
                                                    self.networkIndicator.stopAnimating()
                                                    if error != nil {
                                                        let alert = UIAlertController(title: "No Data Found", message: "Please choose date between 1 to 100", preferredStyle: .alert)

                                                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                                        self.present(alert, animated: true)
                                                    }
                                                    guard let response = response else  {
                                                        return
                                                    }
                                                    self.dataSource = response
                                                    self.data = self.dataSource
                                                    self.reloadCollectionView()
        })
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
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
        let dataModal = self.data[indexPath.row]
        let cellViewModel = AstroAlbumCellViewModel(dataModal)
        cell.cellVModal = cellViewModel        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                           withReuseIdentifier: AstroAlbumHeaderView.identifier,
                                                                           for: indexPath) as? AstroAlbumHeaderView else {
            fatalError("No Astro Album header view found")
        }
        header.configureView()
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailViewController = AlbumDetailViewController()
        detailViewController.viewModel = AstroAlbumCellViewModel(self.data[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
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
                            left: 10,
                            bottom: 2,
                            right: 10)
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


extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}


extension AlbumViewController : HeaderViewDelegate {
    func onClickReloadData(_ numberOfDays: Int) {
        networkIndicator = NetworkActivityIndicator(title: nil, message: "Please wait...", preferredStyle: .alert)
        self.present(self.networkIndicator, animated: false, completion: nil)
        
        self.getAstroAlbumData(numberOfDays: -numberOfDays)
    }
    
    func didTapOnFilter(_ filterBy: FilterType) {
        
        self.data = self.dataSource
        if filterBy == .image {
            self.data = self.dataSource.filter({ $0.media_type == "image"})
        } else if filterBy == .video {
            self.data = self.dataSource.filter({$0.media_type == "video"})
        }
        self.collectionView.reloadData()
    }
}


