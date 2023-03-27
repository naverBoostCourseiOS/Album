//
//  ViewController.swift
//  MyAlbum
//
//  Created by 강동영 on 2023/03/07.
//

import UIKit
import Photos

final class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 220)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlbumGridCell.self, forCellWithReuseIdentifier: AlbumGridCell.identifer)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else { return }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        navigationItem.title = "앨범"
        view.backgroundColor = .red
        
        // PHPhotoLibrary.authorizationStatus() Deprecated in future
        let photoAutoriztionStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        
        switch photoAutoriztionStatus {
        case .authorized:
            print("authorized")
            requestCollection()
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
            // PHPhotoLibrary.requestAuthorization(<#T##handler: (PHAuthorizationStatus) -> Void##(PHAuthorizationStatus) -> Void#>) Deprecated in future
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                switch status {
                case .authorized:
                    self.requestCollection()
                case .denied:
                    print("denied")
                case .limited:
                    print("limited")
                    
                default: break
                }
            }
        case .restricted:
            print("restricted")
        case .limited:
            print("limited")
        @unknown default:
            fatalError()
        }
        
        collectionView.reloadData()
    }


}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource Method
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumGridCell.identifer, for: indexPath)
        guard let convertedCell = cell as? AlbumGridCell else { return cell }
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: 30, height: 30),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: { image, _ in

            convertedCell.imageView.image = UIImage(systemName: "photo")
            convertedCell.albumTitleLabel.text = "dummyTitle"
            convertedCell.albumCountLabel.text = "100"
        })
        return convertedCell
    }
}
