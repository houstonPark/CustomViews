//
//  MainCollectionViewCell.swift
//  CustomViews
//
//  Created by Houston Park on 2022/09/02.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(title: String) {
        titleLabel.text = title
    }
}
