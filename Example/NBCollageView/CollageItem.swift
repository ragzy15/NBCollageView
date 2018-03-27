//
//  CollageItem.swift
//  Sample CollageApp
//
//  Created by Nikhil Batra on 20/03/18.
//  Copyright (c) 2018 nikhilbatra789. All rights reserved.
//

import Foundation

class CollageItem {
    
    var relativeFrames = [String]()
    
    init(json:[String:Any]) {
        
        if let frames = json["relativeFramesStrings"] as? [String] {
            self.relativeFrames = frames
        }
    }
    
    class func objectArrayFromDictArray(dictArray:[[String:Any]]) -> [CollageItem] {
        var objects = [CollageItem]()
        for dict in dictArray {
            objects.append(CollageItem(json: dict))
        }
        return objects
    }
}
