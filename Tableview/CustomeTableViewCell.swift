//
//  CustomeTableViewCell.swift
//  CollectionViewWithMovingItem
//
//  Created by Chandan Singh on 8/21/16.
//  Copyright © 2016 Cao Jiannan. All rights reserved.
//

import UIKit
typealias WSCompletionBlock = (responseData :String!) ->()


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
    
    func setUpTableViewCell(cellinfo : CustomeTableViewCellModel){
        imgView.image = cellinfo.image
        lblName.text = cellinfo.name
        switchView.setOn(cellinfo.switchOnorOff, animated:false)
    }
    
    func showbuttonClick(cellinfo:CustomeTableViewCellModel, completionBlock:WSCompletionBlock)
    {
        imgView.image = cellinfo.image
        lblName.text = cellinfo.name
        switchView.setOn(cellinfo.switchOnorOff, animated:false)
        completionBlock1 = completionBlock

    }
    
    @IBAction func switchAction(sender: AnyObject) {
      
        //deleget
        
        // deleget.didTapedSwitch(self)
        
        //completionHandler
        completionBlock1!(responseData: "hi")
    }
}


class CustomeTableViewCellModel {
    var name : String!
    var switchOnorOff : Bool!
    var image : UIImage!
}