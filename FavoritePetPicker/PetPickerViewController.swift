//
//  PetPickerViewController.swift
//  FavoritePetPicker
//
//  Created by Pedro Mota on 04/06/23.
//

import UIKit

class PetPickerViewController: UIViewController {
    
    weak var delegate: PetPickerDelegate?
    
    private var tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private var pets: [Pet] = [
        .init(emoji: "🐶", name: "Dog"),
        .init(emoji: "🐱", name: "Cat"),
        .init(emoji: "🐮", name: "Cow"),
        .init(emoji: "🐵", name: "Monkey"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PetPickerTableViewCell.self, forCellReuseIdentifier: PetPickerTableViewCell.identifier)
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}

protocol PetPickerDelegate: AnyObject {
    func petPicker(didSelect pet: Pet) -> Void
}

extension PetPickerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.petPicker(didSelect: pets[indexPath.row])
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = PetPickerTableViewCell()
            cell.configureCell(with: pets[0])
            return cell
        case 1:
            let cell = PetPickerTableViewCell()
            cell.configureCell(with: pets[1])
            return cell
        case 2:
            let cell = PetPickerTableViewCell()
            cell.configureCell(with: pets[2])
            return cell
        case 3:
            let cell = PetPickerTableViewCell()
            cell.configureCell(with: pets[3])
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            return cell
        }
    }
    
}
