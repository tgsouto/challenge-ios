//
//  BannerRemote.swift
//  a Lodjinha
//
//  Created by Priscila Marques on 5/10/18.
//  Copyright © 2018 Tiago Souto. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

class BannerRemote: BasicRemote {
    
    func list () -> Observable<ResponseModel.Banners> {
        let url = baseUrl + "token"
        return Observable.create { observer in
            Alamofire.request(url, method: .post).responseObject {
                (response: DataResponse<ResponseModel.Banners>) in
                if (response.result.isSuccess) {
                    let banners: ResponseModel.Banners = response.result.value!
                    observer.on(.next(banners))
                } else {
                    observer.on(.next(nil))
                }
                observer.on(.completed)
            }
        }
        return Disposables.create()
    }
    
}
