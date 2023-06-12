//
//  FavoritePetViewController.swift
//  FavoritePetPicker
//
//  Created by Pedro Mota on 04/06/23.
//

import UIKit

class FavoritePetViewController: UIViewController {
    
    private var petImage: UILabel = .init()
    private var petName: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Select",
            primaryAction: UIAction { [weak self] _ in
                guard let self else { return }
                self.presentPicker()
            }
        )
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(petImage)
        
        petImage.text = "🐶"
        
        petImage.font = UIFont.systemFont(ofSize: 96)
        
        petImage.translatesAutoresizingMaskIntoConstraints = false
        petImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        petImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        
        view.addSubview(petName)
        
        petName.text = "Your favorite pet is: dog!"
        
        petName.font = UIFont.preferredFont(forTextStyle: .body)
        
        petName.translatesAutoresizingMaskIntoConstraints = false
        petName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        petName.bottomAnchor.constraint(equalTo: petImage.topAnchor, constant: -4).isActive = true
    }
    
    private func presentPicker() {
        let viewController = PetPickerViewController()
        
        viewController.delegate = self
        
        viewController.modalPresentationStyle = .pageSheet
        viewController.modalTransitionStyle = .coverVertical
        
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        present(viewController, animated: true)
    }
}

extension FavoritePetViewController: PetPickerDelegate {
    func petPicker(didSelect pet: Pet) {
        petImage.text = pet.emoji
        petName.text = "Your favorite pet is: \(pet.name)!"
    }
}
