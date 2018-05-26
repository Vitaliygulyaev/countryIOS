//
//  ViewController.swift
//  Country
//
//  Created by user139556 on 5/26/18.
//  Copyright © 2018 user139556. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var countries = [Countryinfo]()
    
    override func viewDidLoad() {
         super.viewDidLoad()
        /* getJSON {
            self.tableView.reloadData()
            print("Successeful")
        }*/
        load()
        tableView.delegate = self
        tableView.dataSource = self
    }
        
        func load() {
            GetCountry().getJSON { countries in
            self.countries = countries
            self.tableView.reloadData()
            print("Successeful")
            }
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = countries[indexPath.row].name.capitalized
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CountryViewController {
            destination.country = countries[(tableView.indexPathForSelectedRow?.row)!]
            
        }
    }
    
    /*func getJSON(completion: @escaping () -> ()) {
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                self.countries = try JSONDecoder().decode([Countryinfo].self, from: data!)
                    DispatchQueue.main.async {
                        completion()
                    }
                }catch {
                    print("JSON Error")
                }
            }
        }.resume()
        
    }*/
    

/*extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CountryTableViewCell
        
        
        /*if let url = URL(string: product.images.first ?? "") {
         cell?.iconImageView?.af_setImage(withURL: url)
         }*/
        
        cell?.titleLabel?.text = countries[indexPath.row].name.capitalized
        
        return cell!

}*/
}

