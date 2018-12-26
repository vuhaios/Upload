//
//  UPCarouselFlowLayout.swift
//  TEST
//
//  Created by Vuha Sri on 12/25/18.
//  Copyright © 2018 Vuha Sri. All rights reserved.
//




import UIKit

import UPCarouselFlowLayout
import MBProgressHUD




struct jsonstruct:Decodable {
    
    let name:String
    
    let capital:String
    
    let alpha2Code:String
    
    let alpha3Code:String
    
    let region:String
    
    let subregion:String
    
    struct ModelCollectionFlowLayout {
        
        
        
        let name:String
        
        let capital:String
        
        
        
    }
    
    
    
}

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    
    var arrdata = [jsonstruct]()
    
    
    
    
    
    @IBOutlet weak var collectView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let spe = MBProgressHUD.showAdded(to: self.view, animated: true)
        spe.label.text = "Loading"
        spe.detailsLabel.text = "Please Wait"
        spe.contentColor = UIColor.blue
        
        spe.isUserInteractionEnabled = true
            spe.hide(animated: true, afterDelay: 5)
        let floawLayout = UPCarouselFlowLayout()
        
        
        
        floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: collectView.frame.size.height)
        
        
        
        floawLayout.scrollDirection = .horizontal
        
        
        
        floawLayout.sideItemScale = 0.8
        
        
        
        floawLayout.sideItemAlpha = 1.0
        
        
        
        floawLayout.spacingMode = .fixed(spacing: 5.0)
        
        
        
        collectView.collectionViewLayout = floawLayout
        
        
        getdata()
        
    }
    
    
    
    func getdata(){
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{if error == nil{
                
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                
                
                for mainarr in self.arrdata{
                    
                    //print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                    
                    DispatchQueue.main.async {
                        
                        self.collectView.reloadData()
                        
                        
                    }
                    
                    
                    
                }
                
                }
                
                
                
            }catch{
                
                print("Error in get json data")
                
            }
            
            
            
            }.resume()
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrdata.count
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        
    {
        
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! NewCollectionViewCell
        
        cell.lblname.text = "Published: \(arrdata[indexPath.row].name)"
        
        cell.lblcapital.text = "Location : \(arrdata[indexPath.row].capital)"
        let spe = MBProgressHUD.showAdded(to: self.view, animated: true)
        spe.hide(animated: true)
        
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "First") as! DetailViewController
        detail.strregion = "Region :\(arrdata[indexPath.row].region)"
        detail.strsubregion = "Title :\(arrdata[indexPath.row].subregion)"
        detail.stralpha3 = "Alpha3code :\(arrdata[indexPath.row].alpha3Code)"
        detail.stralpha2 = "Alpha2code :\(arrdata[indexPath.row].alpha2Code)"
        self.navigationController?.pushViewController(detail, animated: true)

    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    




