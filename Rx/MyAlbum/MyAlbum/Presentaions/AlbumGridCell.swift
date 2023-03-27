//
//  AlbumGridCell.swift
//  MyAlbum
//
//  Created by 강동영 on 2023/03/07.
//

import UIKit

class AlbumGridCell: UICollectionViewCell {
    
    static let identifer: String = String(describing: AlbumGridCell.self)
    
    public var imageView: UIImageView = UIImageView.init(frame: .zero)
    public var albumTitleLabel: UILabel = UILabel.init(frame: .zero)
    public var albumCountLabel: UILabel = UILabel.init(frame: .zero)
    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initLayout() {
        let views = [
            imageView,
            albumTitleLabel,
            albumCountLabel,
        ]
        addSubview(vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        views.forEach({
            self.vStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
