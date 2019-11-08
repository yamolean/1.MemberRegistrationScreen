//
//  PlaceEditCell.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

protocol PlaceEditCellDelegate: AnyObject {
    func placeEditCellDidDoneButtonTapped(_ cell: PlaceEditCell)
    func placeEditCell(_ cell: PlaceEditCell, didSelectPlace place: String)
}

class PlaceEditCell: UITableViewCell {
    
    @IBOutlet weak var placeTextField: PickerTextField!
    
    lazy var currentValue: String? = placeTextField.pickerContents.first
    
    weak var delegate: PlaceEditCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        placeTextField.delegate = self

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PlaceEditCell: UITextFieldDelegate, PickerTextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeTextField.text = currentValue
    }
    
    func pickerTextFieldDidDoneButtonTapped(_ textField: PickerTextField) {
        delegate?.placeEditCellDidDoneButtonTapped(self)
    }
    
    func pickerTextField(_ textField: PickerTextField, didSelectPickerValue value: String) {
        delegate?.placeEditCell(self, didSelectPlace: value)
    }
}
