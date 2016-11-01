//
//  FirstViewController.swift
//  CollectionViewWithMovingItem
//
//  Created by Chandan Singh on 8/21/16.
//  Copyright © 2016 Cao Jiannan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Do any additional setup after loading the view.
    }
    
    var totalProfileArray:[CustomeTableViewCellModel] = {
        var profile = [] as [CustomeTableViewCellModel]
        for index in 0...31 {
            let item = CustomeTableViewCellModel()
            item.image = UIImage(named: "\(index)_full")!
            item.name = "Profile...\(index)"
            item.switchOnorOff = false
            profile.append(item)
        }
        return profile
    }()
}

extension FirstViewController : UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomeTableViewCell
      
        //With deleget 
        
        // cell.setUpTableViewCell(totalProfileArray[indexPath.row])
        //cell.deleget = self
        //or
        
        //With Block
        cell.showbuttonClick(totalProfileArray[(indexPath as NSIndexPath).row]) { (responseData) -> () in
            
            let item = self.totalProfileArray[((indexPath as NSIndexPath).row)]
            item.switchOnorOff = cell.switchView.isOn
            print("hi bro you have done this :)")
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return totalProfileArray.count
    }

}

extension FirstViewController : CustomeTableViewCellDelegate {
   
    func didTapedSwitch(cell: CustomeTableViewCell) {
           let indexPath = tableView.indexPath(for: cell)
           let item = totalProfileArray[((indexPath as NSIndexPath?)?.row)!]
            item.switchOnorOff = cell.switchView.isOn
        
    }
}
