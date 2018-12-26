//
//  SecondViewController.swift
//  TEST
//
//  Created by Vuha Sri on 12/25/18.
//  Copyright © 2018 Vuha Sri. All rights reserved.
//

import UIKit
struct Coin: Decodable {
    private enum CodingKeys: String, CodingKey {
        case symbol, priceUSD = "price_usd"
    }
    let symbol : String
    let priceUSD : String
}
    



class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    var coins = [Coin]()
    
var coinNameLable: UILabel!
    
 var priceLable: UILabel!

    
   
    
    @IBOutlet weak var tableCase: UITableView!
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
getCoinData()
        // Do any additional setup after loading the view.
    }
    func getCoinData() {
        let jsonURL = "https://api.coinmarketcap.com/v1/ticker/"
        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!) { [unowned self] (data, response, error) in
            guard let data = data else { return }
            do {
                self.coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.tableCase.reloadData()
                }
                
            } catch {
                print("Error is : \n\(error)")
            }
            }.resume()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Third", for: indexPath) as! TableViewCell
        
        let coin = coins[indexPath.row]
        cell.coinNameLable.text = coin.symbol
        cell.priceLable.text = coin.priceUSD
        
        return cell
        

    }
   

}
