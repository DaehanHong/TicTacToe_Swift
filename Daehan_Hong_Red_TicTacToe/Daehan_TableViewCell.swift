//
//  Daehan_TableViewCell.swift
//  Daehan_Hong_Red_TicTacToe
//
//  Created by Daehan Hong on 2019-09-25.
//  Copyright © 2019 Daehan Hong. All rights reserved.
//

import UIKit

class Daehan_TableViewCell: UITableViewCell {
    
    //MARK:- Class variables
    var gameData : GameData?
    
    // MARK:- Outlets
    
    @IBOutlet weak var winLossImage: UIImageView!
    @IBOutlet weak var whoWon: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
