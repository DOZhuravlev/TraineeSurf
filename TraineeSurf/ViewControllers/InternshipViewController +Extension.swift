//
//  InternshipViewController +Extension.swift
//  TraineeSurf
//
//  Created by Zhuravlev Dmitry on 12.02.2023.
//

import UIKit

extension InternshipViewController {

    //MARK: - Create Outlets

    func createBackgroundImage() -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }

    func createContentViewBottom() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 32
        return view
    }

    func createInternshipNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: Fonts.sfProDisplayBold, size: 24)
        label.textColor = Colors.blackColor
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.12
        label.attributedText = NSMutableAttributedString(string: "Стажировка в Surf", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func createAboutInternshipLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: Fonts.sfProDisplayRegular, size: 14)
        label.textColor = Colors.grayColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        label.attributedText = NSMutableAttributedString(string: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func createWantInternshipLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: Fonts.sfProDisplayRegular, size: 14)
        label.textColor = Colors.grayColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        label.attributedText = NSMutableAttributedString(string: "Хочешь к нам?", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func createSendApplicationButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Отправить заявку", for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.sfProDisplayMedium, size: 16)
        button.titleLabel?.textColor = Colors.whiteColor
        button.backgroundColor = Colors.blackColor
        button.layer.cornerRadius = 32
        button.addTarget(self, action: #selector(sendApplicationPressedButton), for: .touchUpInside)
        return button
    }

    func createCollectionView() -> UICollectionView {
        let layout = createLayout()

        /*
         layout.scrollDirection = .horizontal
         layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
         layout.minimumInteritemSpacing = 12
         layout.sectionInset.right = 12
         */

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }

    //MARK: - Setup Hierarchy

    func setupHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(contentViewBottom)
        view.addSubview(nameInternshipLabel)
        view.addSubview(aboutInternshipLabel)
        view.addSubview(collectionView)
        view.addSubview(wantInternshipLabel)
        view.addSubview(sendApplicationButton)
    }


    //MARK: - Setup Constraints

    func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -169),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -99),
            backgroundImage.widthAnchor.constraint(equalToConstant: 713),
            backgroundImage.heightAnchor.constraint(equalToConstant: 713),

            contentViewBottom.widthAnchor.constraint(equalToConstant: 375),
            contentViewBottom.heightAnchor.constraint(equalToConstant: 276),
            contentViewBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            contentViewBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentViewBottom.topAnchor.constraint(equalTo: view.topAnchor, constant: 478),
            

            nameInternshipLabel.leadingAnchor.constraint(equalTo: contentViewBottom.leadingAnchor, constant: 20),
            nameInternshipLabel.topAnchor.constraint(equalTo: contentViewBottom.topAnchor, constant: 24),
            nameInternshipLabel.trailingAnchor.constraint(equalTo: contentViewBottom.trailingAnchor, constant: 141),

            aboutInternshipLabel.leadingAnchor.constraint(equalTo: contentViewBottom.leadingAnchor, constant: 20),
            aboutInternshipLabel.topAnchor.constraint(equalTo: nameInternshipLabel.bottomAnchor, constant: 12),
            aboutInternshipLabel.trailingAnchor.constraint(equalTo: contentViewBottom.trailingAnchor, constant: -20),
            aboutInternshipLabel.widthAnchor.constraint(equalTo: contentViewBottom.widthAnchor, constant: -40),

            collectionView.leadingAnchor.constraint(equalTo: contentViewBottom.leadingAnchor, constant: 20),
            collectionView.topAnchor.constraint(equalTo: aboutInternshipLabel.bottomAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: contentViewBottom.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 44),

            wantInternshipLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 52),
            wantInternshipLabel.leadingAnchor.constraint(equalTo: contentViewBottom.leadingAnchor, constant: 20),
            wantInternshipLabel.trailingAnchor.constraint(equalTo: contentViewBottom.trailingAnchor, constant: -263),

            sendApplicationButton.bottomAnchor.constraint(equalTo: contentViewBottom.bottomAnchor, constant: 0),
            sendApplicationButton.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -20),
            sendApplicationButton.heightAnchor.constraint(equalToConstant: 60),
            sendApplicationButton.widthAnchor.constraint(equalToConstant: 219)
        ])
    }
}
