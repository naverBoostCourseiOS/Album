//
//  AlbumViewModel.swift
//  Album
//
//  Created by Doyeon on 2023/03/23.
//

import Foundation

protocol AlbumViewModelDelegate: AnyObject {
    func fetchAlbumInfo()
}

class AlbumViewModel {
    weak var delegate: AlbumViewModelDelegate?
    var albums: [Album] = []
    
    init() {
        // model 갔다옴
        self.addAlbums()
    }
    
    // view에서 접근 하면안됨
    private func addAlbums() {
        albums = dummyAlbumList
    }
    
    // View가 ViewModel한테 Request할 함수를 통해서 View한테 Data 전달
    public func fetchAlbumInfo() {
        delegate?.fetchAlbumInfo()
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
