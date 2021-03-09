//
//  NetworkActivityIndicator.swift
//  AstroAlbum
//
//  Created by SaravanaKumaran Sakthivel on 08/03/21.
//

import UIKit

class NetworkActivityIndicator: UIAlertController {

    private var loadingIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10,
                                                                 y: 5,
                                                                 width: 50,
                                                                 height: 50))
        loadingIndicator?.hidesWhenStopped = true
        loadingIndicator?.style = .medium
        loadingIndicator?.startAnimating();
        self.view.addSubview(loadingIndicator)
    }
    
    func stopAnimating() {
        
        DispatchQueue.main.async {
            self.loadingIndicator?.stopAnimating()
            self.dismiss(animated: false, completion: nil)
        }
    }
}
