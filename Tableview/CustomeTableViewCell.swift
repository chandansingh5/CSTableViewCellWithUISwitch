//
//  CustomeTableViewCell.swift
//  CollectionViewWithMovingItem
//
//  Created by Chandan Singh on 8/21/16.
//  Copyright © 2016 Cao Jiannan. All rights reserved.
//

import UIKit
typealias WSCompletionBlock = (_ responseData :String?) ->()


protocol CustomeTableViewCellDelegate{
    func didTapedSwitch(cell:CustomeTableViewCell)
}

class CustomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var switchView: UISwitch!
    var deleget : CustomeTableViewCellDelegate!
    var completionBlock1: WSCompletionBlock?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpTableViewCell(_ cellinfo : CustomeTableViewCellModel){
        imgView.image = cellinfo.image
        lblName.text = cellinfo.name
        switchView.setOn(cellinfo.switchOnorOff, animated:false)
    }
    
    func showbuttonClick(_ cellinfo:CustomeTableViewCellModel, completionBlock:@escaping WSCompletionBlock)
    {
        imgView.image = cellinfo.image
        lblName.text = cellinfo.name
        switchView.setOn(cellinfo.switchOnorOff, animated:false)
        completionBlock1 = completionBlock

    }
    
    @IBAction func switchAction(_ sender: AnyObject) {
      
        //deleget
        
        // deleget.didTapedSwitch(self)
        
        //completionHandler
        completionBlock1!("hi")
    }
}


class CustomeTableViewCellModel {
    var name : String!
    var switchOnorOff : Bool!
    var image : UIImage!
}
