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
    
    lazy var totalProfileArray:[CustomeTableViewCellModel] = {
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

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomeTableViewCell
      
        //With deleget 
        
        // cell.setUpTableViewCell(totalProfileArray[indexPath.row])
        //cell.deleget = self
        //or
        
        //With Block
        cell.showbuttonClick(totalProfileArray[indexPath.row]) { (responseData) -> () in
            
            print("hi bro you have done this :)")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return totalProfileArray.count
    }

}

extension FirstViewController : CustomeTableViewCellDelegate {
   
    func didTapedSwitch(cell: CustomeTableViewCell) {
           let indexPath = tableView.indexPathForCell(cell)
           let item = totalProfileArray[(indexPath?.row)!]
            item.switchOnorOff = cell.switchView.on
        
    }
}
