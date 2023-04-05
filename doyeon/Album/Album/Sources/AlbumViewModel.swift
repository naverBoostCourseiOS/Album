//
//  AlbumViewModel.swift
//  Album
//
//  Created by Doyeon on 2023/03/23.
//

import Foundation

protocol AlbumViewModel: AnyObject {
    var items: [AlbumItemViewModel] { get }
    
    func loadAlbumItems()
}

final class DefaultAlbumViewModel: AlbumViewModel {

    private var albums: [Album] = []
    private(set) var items: [AlbumItemViewModel] = []
    
    init() {
        self.addAlbums()
    }
    
    private func addAlbums() {
        albums = dummyAlbumList
    }
    
    func loadAlbumItems() {
        items = albums.map { .init(name: $0.name, count: $0.count) }
    }
    
}

struct AlbumItemViewModel {
    let name: String
    let count: Int
}

extension AlbumItemViewModel {
    init(album: Album) {
        self.name = album.name
        self.count = album.count
    }
}

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
