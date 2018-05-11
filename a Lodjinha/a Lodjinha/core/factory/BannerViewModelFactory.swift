//
//  BannerViewModelFactory.swift
//  a Lodjinha
//
//  Created by Priscila Marques on 5/10/18.
//  Copyright © 2018 Tiago Souto. All rights reserved.
//

import Foundation

struct BannerViewModelFactory {
    static func create () -> BannerViewModel {
        return BannerViewModel(userPrefs: UserPrefs())
    }
}
