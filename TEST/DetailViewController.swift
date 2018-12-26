//
//  UPCarouselFlowLayout.swift
//  TEST
//
//  Created by Vuha Sri on 12/25/18.
//  Copyright © 2018 Vuha Sri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var alpha2: UILabel!
    
    @IBOutlet var alpha3: UILabel!
    
    @IBOutlet var subregion: UILabel!
    
    @IBOutlet var region: UILabel!
    
    
    var strregion = ""
    var strsubregion = ""
    var stralpha2 = ""
    var stralpha3 = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let spe = MBProgressHUD.showAdded(to: self.view, animated: true)
        spe.label.text = "Getting the Data"
        spe.contentColor = UIColor.white
        spe.backgroundView.color = UIColor.brown
        spe.detailsLabel.text = "Please Wait"
        spe.isUserInteractionEnabled = true
        spe.hide(animated: true, afterDelay: 3)
        alpha2.text = stralpha2
        alpha3.text = stralpha3
        region.text = strregion
        subregion.text = strsubregion
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
