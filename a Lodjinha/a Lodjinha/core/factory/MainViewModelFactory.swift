//
//  BannerViewModelFactory.swift
//  a Lodjinha
//
//  Created by Priscila Marques on 5/10/18.
//  Copyright © 2018 Tiago Souto. All rights reserved.
//

import Foundation

struct MainViewModelFactory {
    static func create () -> MainViewModel {
        return MainViewModel(bannerRemote: BannerRemote())
    }
}
