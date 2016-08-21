//
//  CustomeTableViewCell.swift
//  CollectionViewWithMovingItem
//
//  Created by Chandan Singh on 8/21/16.
//  Copyright © 2016 Cao Jiannan. All rights reserved.
//

import UIKit

protocol CustomeTableViewCellDelegate{
    func didTapedSwitch(cell:CustomeTableViewCell)
}

class CustomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var switchView: UISwitch!
    var deleget : CustomeTableViewCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpTableViewCell(cellinfo : CustomeTableViewCellModel){
        imgView.image = cellinfo.image
        lblName.text = cellinfo.name
        switchView.setOn(cellinfo.switchOnorOff, animated:false)
    }
    
    @IBAction func switchAction(sender: AnyObject) {
        deleget.didTapedSwitch(self)
    }
}


class CustomeTableViewCellModel {
    var name : String!
    var switchOnorOff : Bool!
    var image : UIImage!
}