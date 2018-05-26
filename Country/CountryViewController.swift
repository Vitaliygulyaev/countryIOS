//
//  CountryViewController.swift
//  Country
//
//  Created by user139556 on 5/26/18.
//  Copyright © 2018 user139556. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}


class CountryViewController: UIViewController {
    
    //@IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textCountry: UILabel!
    @IBOutlet weak var textCapital: UILabel!
    @IBOutlet weak var textRegion: UILabel!
    @IBOutlet weak var Population: UILabel!
    
    var country:Countryinfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textCountry.text = country?.name
        //textCapital.text = country?.capital
        if country?.capital == "" {
            country?.capital = "there is no such"
            self.textCapital.text = country?.capital
        } else {
            textCapital.text = country?.capital
        }
        textRegion.text = country?.region
        Population.text = "\((country?.population)!)"
        let urlString = country?.flag
        
        let url = URL(string: urlString!)
        
        imageView.downloadedFrom(url: url!)
        
    }
    
}



