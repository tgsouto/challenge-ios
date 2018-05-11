//
//  ResponseModel.swift
//  a Lodjinha
//
//  Created by Priscila Marques on 5/10/18.
//  Copyright © 2018 Tiago Souto. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResponseModel {
    class Banner: Mappable {
        var id: Int = 0
        var urlImagem: String = ""
        var linkUrl: String = ""
        
        required init?(map: Map) {}
        
        func mapping(map: Map) {
            self.id <- map["id"]
            self.urlImagem <- map["urlImagem"]
            self.linkUrl <- map["linkUrl"]
        }
    }
    
    class Banners: Mappable {
        var data: [Banner] = []
        
        required init?(map: Map) {}
        
        func mapping(map: Map) {
            self.data <- map["data"]
        }
    }
}
