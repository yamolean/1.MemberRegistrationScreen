//
//  BioEditCell.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

protocol BioEditCellDelegate: AnyObject {
    func bioEditCell(_ cell: BioEditCell, didEditingBio bio: String)
}


class BioEditCell: UITableViewCell {
    
    @IBOutlet weak var bioTextView: PlaceholderTextView!
    @IBOutlet weak var bioCountLabel: UILabel!
    
    weak var delegate: BioEditCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bioTextView.delegate = self
        bioTextView.placeholder = "どんな人？"
        bioTextView.placeholderTextColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        bioTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        bioTextView.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BioEditCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let textCount =  100 - textView.text.count
        var countLabelText: String!
        if textCount > 0 {
            countLabelText = "\(textCount)/100"
        } else {
            countLabelText = "0/100"
        }
        bioCountLabel.text = countLabelText
        delegate?.bioEditCell(self, didEditingBio: textView.text)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let str = textView.text.mutableCopy() as? NSMutableString else { return true }
        str.replaceCharacters(in: range, with: text)
        return (str as String).count <= 100
    }
}
