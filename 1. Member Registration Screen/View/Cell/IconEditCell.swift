//
//  IconEditCell.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

protocol IconEditCellDelegate: AnyObject {
    func iconEditCellDidIconButtonTapped(_ cell: IconEditCell)
}

final class IconEditCell: UITableViewCell {

    @IBOutlet weak var iconButton: UIButton!
    //いらない
    //@IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: IconEditCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //イベント検知
        iconButton.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
        //画像を丸く
        iconButton.layer.cornerRadius = iconButton.bounds.size.width / 2
    }
    
    @objc private func iconButtonTapped(_ sender: UIButton) {
        delegate?.iconEditCellDidIconButtonTapped(self)
    }
    
    func setImage(_ image: UIImage) {
        iconButton.setBackgroundImage(image, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
