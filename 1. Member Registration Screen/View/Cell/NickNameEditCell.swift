//
//  NickNameEditCell.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

protocol NickNameEditCellDelegate: AnyObject {
    func nickNameEditCell(_ cell: NickNameEditCell, nickNameDidEdiding text:String)
}

class NickNameEditCell: UITableViewCell {

    @IBOutlet weak var nicknameTextField: UITextField!
    
    weak var delegate: NickNameEditCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nicknameTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NickNameEditCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") as NSString
        let resultString = text.replacingCharacters(in: range, with: string)
        delegate?.nickNameEditCell(self, nickNameDidEdiding: resultString)
        return resultString.count <= 15
    }
}
