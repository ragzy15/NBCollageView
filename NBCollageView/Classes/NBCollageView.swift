//
//  NBCollageView.swift
//  Sample CollageApp
//
//  Created by Nikhil Batra on 22/03/18.
//  Copyright (c) 2018 nikhilbatra789. All rights reserved.
//

import UIKit

@objc public protocol NBCollageProtocol: NSObjectProtocol {
    @objc optional func didSelectCollageElement(element:NBCollageElement)
    @objc optional func didBeginReceivingTouches(element:NBCollageElement)
    @objc optional func didMoveOutsideCurrentElement(element:NBCollageElement)
    @objc optional func didEndReceivingTouches(element:NBCollageElement)
    @objc optional func didEnterDeleteView(collageElement:NBCollageElement, deleteView:UIView)
    @objc optional func didLeaveDeleteView(collageElement:NBCollageElement, deleteView:UIView)
    @objc optional func didDeleteImageInElement(collageElement:NBCollageElement)
    
    var borderColor: UIColor? { get set }
}

public class NBCollageView: UIView, NBCollageElementProtocol {

    public var translationImageView: UIImageView?
    public var delegate: NBCollageProtocol?
    public var deleteView: UIView? {
        didSet {
            for subview in self.subviews {
                if subview is NBCollageElement {
                    (subview as? NBCollageElement)?.deleteView = self.deleteView
                }
            }
        }
    }
    
    public var allElements: [NBCollageElement] {
        get {
            var elements = [NBCollageElement]()
            for subview in self.subviews {
                if subview is NBCollageElement {
                    elements.append(subview as! NBCollageElement)
                }
            }
            return elements
        }
    }
    
    public func initializeCollageView(relativeFrames:[String]) {
        for frame in relativeFrames {
            let child = NBCollageElement(superView: self, relativeFrame: CGRectFromString(frame))
            child.delegate = self
            
            if let borderColor = self.delegate?.borderColor {
                let layer = CALayer()
                layer.frame = child.bounds
                layer.borderColor = borderColor.cgColor
                layer.borderWidth = 1
                child.layer.addSublayer(layer)
            }
        }
    }
    
    func didSelectNBCollageElement(element: NBCollageElement) {
        self.delegate?.didSelectCollageElement?(element: element)
    }
    
    func didEnterDeleteView(collageElement: NBCollageElement, deleteView: UIView) {
        self.delegate?.didEnterDeleteView?(collageElement: collageElement, deleteView: deleteView)
    }
    
    func didLeaveDeleteView(collageElement: NBCollageElement, deleteView: UIView) {
        self.delegate?.didLeaveDeleteView?(collageElement: collageElement, deleteView: deleteView)
    }
    
    func didDeleteImageInElement(collageElement:NBCollageElement) {
        self.delegate?.didDeleteImageInElement?(collageElement: collageElement)
    }
    
    func didEndReceivingTouches(element: NBCollageElement) {
        self.delegate?.didEndReceivingTouches?(element: element)
    }
    
    func didBeginReceivingTouches(element: NBCollageElement) {
        self.delegate?.didBeginReceivingTouches?(element: element)
    }
    
    func didMoveOutsideCurrentElement(element: NBCollageElement) {
        self.delegate?.didMoveOutsideCurrentElement?(element: element)
    }
}
