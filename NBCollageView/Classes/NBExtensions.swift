//
//  NBExtensions.swift
//  NBCollageView
//
//  Created by Nikhil Batra on 26/03/18.
//  Copyright (c) 2018 nikhilbatra789. All rights reserved.
//

import UIKit

extension UIImageView {
    func imageFrameSize() -> CGSize {
        if let image = self.image {
            let widthRatio = self.bounds.size.width / image.size.width
            let heightRatio = self.bounds.size.height / image.size.height
            var scale = min(widthRatio, heightRatio)
            if self.contentMode == .scaleAspectFill {
                scale = max(widthRatio, heightRatio)
            }
            let imageWidth = scale * image.size.width
            let imageHeight = scale * image.size.height
            return CGSize(width: imageWidth, height: imageHeight)
        } else {
            return self.frame.size
        }
    }
}
