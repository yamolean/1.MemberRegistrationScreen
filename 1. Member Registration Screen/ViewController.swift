//
//  ViewController.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    fileprivate enum SectionType: Int {
        case basicInfo
        case bio
    }
    
    fileprivate enum RowType: Int {
        case basicInfoIcon
        case basicInfoNickName
        case basicInfoGender
        case basicInfoAge
        case basicInfoPlace
        case bioBio
    }
    
    fileprivate struct Section {
        var sectionType: SectionType
        var rowItems: [RowType]
    }
    
    fileprivate var sections: [Section]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "プロフィール"
    
        sections = [
            Section(sectionType: .basicInfo, rowItems: [.basicInfoIcon, .basicInfoNickName, .basicInfoGender, .basicInfoAge, .basicInfoPlace]),
            Section(sectionType: .bio, rowItems: [.bioBio])
        ]
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "IconEditCell", bundle: nil), forCellReuseIdentifier: IconEditCell.description())
        tableView.register(UINib(nibName: "NickNameEditCell", bundle: nil), forCellReuseIdentifier: NickNameEditCell.description())
        tableView.register(UINib(nibName: "GenderEditCell", bundle: nil), forCellReuseIdentifier: GenderEditCell.description())
        tableView.register(UINib(nibName: "AgeEditCell", bundle: nil), forCellReuseIdentifier: AgeEditCell.description())
        tableView.register(UINib(nibName: "PlaceEditCell", bundle: nil), forCellReuseIdentifier: PlaceEditCell.description())
        tableView.register(UINib(nibName: "BioEditCell", bundle: nil), forCellReuseIdentifier: BioEditCell.description())
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].rowItems[indexPath.row] {
        case .basicInfoIcon:
            let cell = tableView.dequeueReusableCell(withIdentifier: IconEditCell.description()) as! IconEditCell
            cell.delegate = self
            return cell
        case .basicInfoNickName:
            let cell = tableView.dequeueReusableCell(withIdentifier: NickNameEditCell.description()) as! NickNameEditCell
            cell.delegate = self
            return cell
        case .basicInfoGender:
            let cell = tableView.dequeueReusableCell(withIdentifier: GenderEditCell.description()) as! GenderEditCell
            cell.delegate = self
            return cell
        case .basicInfoAge:
            let cell = tableView.dequeueReusableCell(withIdentifier: AgeEditCell.description()) as! AgeEditCell
            cell.delegate = self
            var ageStrings = [String]()
            (18..<100).forEach {
                ageStrings.append(String(describing: $0))
            }
            cell.ageTextField.pickerContents = ageStrings
            return cell
        case .basicInfoPlace:
            let cell = tableView.dequeueReusableCell(withIdentifier: PlaceEditCell.description()) as! PlaceEditCell
            cell.delegate = self
            cell.placeTextField.pickerContents = Prefecture.allCases.map { $0.rawValue }
            return cell
        case .bioBio:
            let cell = tableView.dequeueReusableCell(withIdentifier: BioEditCell.description()) as! BioEditCell
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section].sectionType {
        case .basicInfo:
            return "情報"
        case .bio:
            return "自己紹介"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
}

extension ViewController: IconEditCellDelegate {
    func iconEditCellDidIconButtonTapped(_ cell: IconEditCell) {
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            picker.dismiss(animated: true, completion: nil)
            let iconEditCellIndexPath = IndexPath(row: RowType.basicInfoIcon.rawValue, section: SectionType.basicInfo.rawValue)
            let iconEditCell = tableView.cellForRow(at: iconEditCellIndexPath) as! IconEditCell
            iconEditCell.setImage(image)
        }
    }
}

extension ViewController: NickNameEditCellDelegate {
    func nickNameEditCell(_ cell: NickNameEditCell, nickNameDidEdiding text:String) {
        
    }
}

extension ViewController: GenderEditCellDelegate {
    func genderEditCell(_ cell: GenderEditCell, didSelectGenderButton tag: Int) {
        
    }
}

extension ViewController: AgeEditCellDelegate {
    func ageEditCellDidDoneButtonTapped(_ cell: AgeEditCell) {
        
    }
    
    func ageEditCell(_ cell: AgeEditCell, didSelectAge age: String) {
        
    }
}

extension ViewController: PlaceEditCellDelegate {
    func placeEditCellDidDoneButtonTapped(_ cell: PlaceEditCell) {
        
    }
    
    func placeEditCell(_ cell: PlaceEditCell, didSelectPlace place: String) {
        
    }
}

extension ViewController: BioEditCellDelegate {
    func bioEditCell(_ cell: BioEditCell, didEditingBio bio: String) {
        
    }
}


