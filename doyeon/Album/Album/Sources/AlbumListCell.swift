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
    
    private let lastImage: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    private let albumNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let albumCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setLastImageLayout()
        setAlbumNameLabel()
        setAlbumCountLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with albumItemViewModel: AlbumItemViewModel) {
        albumNameLabel.text = albumItemViewModel.name
        albumCountLabel.text = String(albumItemViewModel.count)
    }
}

extension AlbumListCell {
    private func addSubviews() {
        addSubview(lastImage)
        addSubview(albumNameLabel)
        addSubview(albumCountLabel)
    }
    
    private func setLastImageLayout() {
        lastImage.snp.makeConstraints { make in
            make.width.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(albumNameLabel.snp.top)
        }
    }
    
    private func setAlbumNameLabel() {
        albumNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalTo(albumCountLabel.snp.top)
        }
    }
    
    private func setAlbumCountLabel() {
        albumCountLabel.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
        }
    }
}
