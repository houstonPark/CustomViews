//
//  ViewController.swift
//  CustomViews
//
//  Created by Houston Park on 2022/09/02.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var collectionViewItem: [CustomViewController.Type] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "CustomView List"
        
        self.collectionView.register(UINib(nibName: String(describing: MainCollectionViewCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: MainCollectionViewCell.self))
        
        setDataSource()
    }
    
    private func setDataSource() {
        collectionViewItem = [
        ]
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewControllerType = collectionViewItem[indexPath.item]
        
        let viewController = viewControllerType.create(viewControllerType: viewControllerType.self)
        
        switch viewController.presentingStyle {
        case .navigationPush:
            navigationController?.pushViewController(viewController, animated: true)
        case .presentModal:
            present(viewController, animated: true)
        case .presentFullScreen:
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: view.frame.width - 40, height: 80)
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MainCollectionViewCell.self), for: indexPath) as! MainCollectionViewCell
        
        var title = String(describing: collectionViewItem[indexPath.item].self)
        title.removeLast("ViewController".count)
        cell.configure(title: title)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewItem.count
    }
}
