//
//  Cell.swift
//  TraineeSurf
//
//  Created by Zhuravlev Dmitry on 12.02.2023.
//

import UIKit

final class Cell: UICollectionViewCell {

    static let identifier = "cell"

    //MARK: - Outlets

    lazy var nameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: Fonts.sfProDisplayMedium, size: 14)
        button.layer.cornerRadius = 12
        button.backgroundColor = Colors.lightGrayColor
        button.setTitleColor(Colors.blackColor, for: .normal)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(nameButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            nameButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            nameButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            nameButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }

    func configure(model: Profession) {
        nameButton.setTitle(model.name, for: .normal)
    }
}
