//
//  AgeEditCell.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

protocol AgeEditCellDelegate: AnyObject {
    func ageEditCellDidDoneButtonTapped(_ cell: AgeEditCell)
    func ageEditCell(_ cell: AgeEditCell, didSelectAge age: String)
}

class AgeEditCell: UITableViewCell {
    
    @IBOutlet weak var ageTextField: PickerTextField!
    
    weak var delegate: AgeEditCellDelegate?
    
    lazy var currentValue: String? = ageTextField.pickerContents.first
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ageTextField.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension AgeEditCell: UITextFieldDelegate, PickerTextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ageTextField.text = currentValue
    }

    func pickerTextFieldDidDoneButtonTapped(_ textField: PickerTextField) {
        delegate?.ageEditCellDidDoneButtonTapped(self)
    }

    func pickerTextField(_ textField: PickerTextField, didSelectPickerValue value: String) {
        delegate?.ageEditCell(self, didSelectAge: value)
    }
}
