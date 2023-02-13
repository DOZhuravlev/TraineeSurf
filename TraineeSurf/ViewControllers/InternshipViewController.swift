//
//  ViewController.swift
//  TraineeSurf
//
//  Created by Zhuravlev Dmitry on 09.02.2023.
//

import UIKit

final class InternshipViewController: UIViewController {

    //MARK: - Outlets

    lazy var backgroundImage = createBackgroundImage()
    lazy var contentViewBottom = createContentViewBottom()
    lazy var nameInternshipLabel = createInternshipNameLabel()
    lazy var aboutInternshipLabel = createAboutInternshipLabel()
    lazy var wantInternshipLabel = createWantInternshipLabel()
    lazy var sendApplicationButton = createSendApplicationButton()
    lazy var collectionView = createCollectionView()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    //MARK: - SetupPressedButton

    @objc func sendApplicationPressedButton() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default))
        self.present(alert, animated: true)
    }
}

//MARK: - SetupCollectionView

extension InternshipViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Profession.namesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        cell.configure(model: Profession.namesArray[indexPath.item])
        return cell
    }
}

