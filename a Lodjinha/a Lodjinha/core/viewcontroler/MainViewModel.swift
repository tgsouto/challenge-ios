//
//  BannerViewModel.swift
//  a Lodjinha
//
//  Created by Priscila Marques on 5/10/18.
//  Copyright © 2018 Tiago Souto. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel {
    
    private var bannerRemote: BannerRemote
    
    init(bannerRemote: BannerRemote) {
        self.bannerRemote = bannerRemote
    }
    
    func getBanners() -> Observable<ResponseModel.Banners?> {
        return self.bannerRemote.list()
    }
}
