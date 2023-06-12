//
//  TableViewCell.swift
//  FavoritePetPicker
//
//  Created by Pedro Mota on 04/06/23.
//

import UIKit

class PetPickerTableViewCell: UITableViewCell {
    
    static let identifier = "PetPickerTableViewCell"
    
    private var label: UILabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configureCell(with pet: Pet) {
        addSubview(label)
        
        label.text = "\(pet.emoji) \(pet.name)"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
    }

}
