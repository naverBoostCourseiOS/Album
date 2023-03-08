//
//  ViewController.swift
//  MyAlbum
//
//  Created by 강동영 on 2023/03/07.
//

import UIKit
import Photos

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero)
        collectionView.register(AlbumGridCell.self, forCellWithReuseIdentifier: AlbumGridCell.identifer)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    var fetchRequest: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else { return }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchRequest = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "앨범"
        view.backgroundColor = .red
    }


}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource Method
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumGridCell.identifer, for: indexPath)
        
        return cell
    }
    
    
}

