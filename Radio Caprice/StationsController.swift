//
//  StationsController.swift
//  Radio Caprice
//
//  Created by Simo on 11.02.17.
//  Copyright © 2017 Simo. All rights reserved.
//

import UIKit

class StationsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func closeButton(_ sender: Any) {
        if((self.presentingViewController) != nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    let genres = ["ETHNIC / FOLK / SPIRITUAL MUSIC", "CLASSICAL", "BLUES", "COUNTRY", "JAZZ", "POP MUSIC", "ROCK", "REGGAE / SKA", "METAL / HARDCORE", "ELECTRONIC MUSIC", "RAP / HIP-HOP", "ШАНСОН", "MISCELLANEOUS"]
    
    
    
    let subGenres = [["INDIAN", "RUSSIAN FOLK", "ORTHODOX SPIRITUAL MUSIC"],
        ["SYMPHONY", "CLASSICAL PIANO/HARPSICHORD", "SYMPHONIC MUSIC"],
        ["ACOUSTIC BLUES", "SOUL/NEO SOUL", "GOSPEL"],
        ["ALTERNATIVE COUNTRY", "BLUEGRASS", "COUNTRY"],
        ["SMOOTH JAZZ", "JAZZ FUNK", "NU JAZZ/FUTURE JAZZ/ELECTRO SWING"],
        ["CLASSICAL CROSSOVER", "RUSSIAN POP MUSIC", "POP MUSIC 80's"],
        ["PSYCHOBILLY", "INDIE/TWEE POP", "FOLK ROCK"],
        ["REGGAE", "SKA", "DUB"],
        ["PAGAN METAL", "NEOCLASSICAL METAL", "SYMPHONIC BLACK METAL"],
        ["UPLIFTING TRANCE", "ELECTRO HOUSE", "HARDSTYLE"],
        ["HIP-HOP", "WEST COAST/GANGSTA RAP/G-FUNK", "RUSSIAN RAP"],
        ["ШАНСОН", "ПОСТШАНСОН", "ЦЫГАНСКАЯ ПЕСНЯ"],
        ["OLDIES", "MODERN CLASSICAL", "VOCAL"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return genres[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationsCell", for: indexPath) as! StationsCell
        
        cell.subGenre.text = subGenres[indexPath.section][indexPath.row]
        
        if indexPath.row != 0 {
            cell.lock.image = UIImage(named: "Lock")?.maskWithColor(color:  UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        } else {
            cell.lock.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
