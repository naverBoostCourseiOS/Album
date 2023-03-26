//
//  AlbumListCell.swift
//  Album
//
//  Created by Doyeon on 2023/03/23.
//

import UIKit
import SnapKit

class AlbumListCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = String(describing: AlbumListCell.self)
    
    var LastImage = UIImageView(frame: .zero)
    var albumNameLabel = UILabel(frame: .zero)
    var albumCount = UILabel(frame: .zero)
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        albumNameLabel.font = .systemFont(ofSize: 18)
        albumCount.textColor = .gray
        LastImage.backgroundColor = .gray
        LastImage.layer.cornerRadius = 10
        
        addSubview(LastImage)
        addSubview(albumNameLabel)
        addSubview(albumCount)
        
        LastImage.snp.makeConstraints { make in
            make.width.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(albumNameLabel.snp.top)
        }
        
        albumNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalTo(albumCount.snp.top)
        }
        albumCount.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
