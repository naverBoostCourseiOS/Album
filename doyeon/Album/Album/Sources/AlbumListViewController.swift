//
//  AlbumListViewController.swift
//  Album
//
//  Created by Doyeon on 2023/03/12.
//

import UIKit
import SnapKit

final class AlbumListViewController: UIViewController {

    // MARK: - Properties
    private let viewModel = DefaultAlbumViewModel()
    
    private let albumCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 220)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.register(AlbumListCell.self, forCellWithReuseIdentifier: AlbumListCell.identifier)
        return cv
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "앨범"
        setupUI()
        viewModel.loadAlbumItems()
        DispatchQueue.main.async {
            self.albumCollectionView.reloadData()
        }
    }
}

// MARK: - Methods
extension AlbumListViewController {
    private func setupUI() {
        setDelegates()
        setSubviews()
        setConstraints()
    }
    
    private func setDelegates() {
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
    }
    
    private func setSubviews() {
        view.addSubview(albumCollectionView)
    }
    
    private func setConstraints() {
        albumCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }

}

// MARK: - UICollectionViewDelegate
extension AlbumListViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension AlbumListViewController: UICollectionViewDataSource {
    /// 지정된 섹션에 표시할 항목의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    /// 컬렉션뷰의 지정된 위치에 표시할 셀을 요청
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumListCell.identifier, for: indexPath) as? AlbumListCell else { return AlbumListCell() }
        cell.configure(with: viewModel.items[indexPath.row])
        return cell
    }
}
