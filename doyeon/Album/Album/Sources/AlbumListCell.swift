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
    var albumViewModel = AlbumViewModel()
    var albumNameLabel = UILabel(frame: .zero)
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        albumViewModel.delegate = self
        
        addSubview(albumNameLabel)
        
        albumNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Methods
extension AlbumListCell: AlbumViewModelDelegate {
    func fetchAlbumInfo() {
        //albumNameLabel.text = albumViewModel.albums[0].name //
    }
}
