//
//  ViewController.swift
//  Album
//
//  Created by Doyeon on 2023/03/12.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    // MARK: - Properties
    let viewModel = AlbumViewModel()
    var albums: [Album] = []
    
    private let collectionView: UICollectionView = {
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
        
        viewModel.requestAlbumsData()
        print("Data Flow1 - view model에게 데이터 요청")
    }
}

// MARK: - Methods
extension ViewController {
    private func setupUI() {
        setDelegates()
        setSubviews()
        setConstraints()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.delegate = self
    }
    
    private func setSubviews() {
        let views = [
            collectionView
        ]
        views.forEach {
            view.addSubview($0)
        }
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }

}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    /// 지정된 섹션에 표시할 항목의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    /// 컬렉션뷰의 지정된 위치에 표시할 셀을 요청
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumListCell.identifier, for: indexPath) as? AlbumListCell else { return AlbumListCell() }
        cell.LastImage.image = UIImage(named: "photo")
        cell.albumNameLabel.text = albums[indexPath.item].name
        cell.albumCount.text = "\(albums[indexPath.item].count)"
        return cell
    }
}

extension ViewController: AlbumViewModelDelegate {
    func fetchAlbumInfo(_ albums: [Album]) {
        self.albums = albums
    }
}
