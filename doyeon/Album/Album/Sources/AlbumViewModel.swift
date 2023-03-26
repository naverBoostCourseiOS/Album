//
//  AlbumViewModel.swift
//  Album
//
//  Created by Doyeon on 2023/03/23.
//

import Foundation

protocol AlbumViewModelDelegate: AnyObject {
    func fetchAlbumInfo(_ albums: [Album])
}

class AlbumViewModel {
    weak var delegate: AlbumViewModelDelegate?
    private var albums: [Album] = []
    
    init() {
        self.addAlbums()
    }
    
    private func addAlbums() {
        albums = dummyAlbumList
    }
    
    func requestAlbumsData() {
        delegate?.fetchAlbumInfo(albums)
    }
    
}

// 더미데이터
fileprivate let dummyAlbumList = [
    Album(name: "앨범 1", count: 23),
    Album(name: "앨범 2", count: 9),
    Album(name: "앨범 3", count: 43),
    Album(name: "앨범 4", count: 54),
    Album(name: "앨범 5", count: 65),
    Album(name: "앨범 6", count: 43),
    Album(name: "앨범 7", count: 23),
    Album(name: "앨범 8", count: 12),
    Album(name: "앨범 9", count: 38)
]
