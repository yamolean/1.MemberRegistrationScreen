//
//  GenderEditCell.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

protocol GenderEditCellDelegate: AnyObject {
    func genderEditCell(_ cell: GenderEditCell, didSelectGenderButton tag: Int)
}

final class GenderEditCell: UITableViewCell {
    
    @IBOutlet weak var leftGenderButton: UIButton!
    @IBOutlet weak var centerGenderButton: UIButton!
    @IBOutlet weak var rightGenderButton: UIButton!
    
    weak var delegate: GenderEditCellDelegate?
    
    private var buttons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buttons = [UIButton]()
        buttons.append(leftGenderButton)
        buttons.append(centerGenderButton)
        buttons.append(rightGenderButton)
        
        for i in buttons {
            i.layer.cornerRadius = i.bounds.size.width / 2
            i.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        }
        
    }
    
    @objc private func genderButtonTapped(_ sender: UIButton) {
        for i in buttons {
            i.isSelected = false
            i.layer.borderWidth = 0
            i.layer.borderColor = UIColor.clear.cgColor
        }
        sender.isSelected = true
        sender.layer.borderWidth = 3
        sender.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        delegate?.genderEditCell(self, didSelectGenderButton: sender.tag)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
