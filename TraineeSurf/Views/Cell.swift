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

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Fonts.sfProDisplayMedium, size: 14)
        label.textAlignment = .center
        label.sizeToFit()
        label.layer.cornerRadius = 12
        label.backgroundColor = Colors.lightGrayColor
        label.textColor = Colors.blackColor
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.lightGrayColor
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    //MARK: - Setup

    private func setupHierarchy() {
        addSubview(nameLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }

    func configure(model: Profession) {
        nameLabel.text = model.name
    }

}
