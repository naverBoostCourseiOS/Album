//
//  AlbumListCell.swift
//  Album
//
//  Created by Doyeon on 2023/03/23.
//

import UIKit
import SnapKit

class AlbumListCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: AlbumListCell.self)
    // MARK: - Properties
    var albumNameLabel = UILabel(frame: .zero)
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(albumNameLabel)
        
        albumNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
