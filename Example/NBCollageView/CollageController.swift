//
//  CollageController.swift
//  Sample CollageApp
//
//  Created by Nikhil Batra on 20/03/18.
//  Copyright (c) 2018 nikhilbatra789. All rights reserved.
//

import UIKit
import ImagePicker
import NBCollageView

class CollageController: UIViewController, NBCollageProtocol, ImagePickerDelegate {
    
    @IBOutlet weak var containerView: NBCollageView!
    @IBOutlet weak var deleteView: UIView!
    
    var collageItem: CollageItem?
    var selectedElement: NBCollageElement?
    
    class func controllerWithCollageItem(item: CollageItem) -> CollageController {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollageController") as! CollageController
        controller.collageItem = item
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.loadCollages()
        
        self.deleteView.backgroundColor = UIColor.white
    }
    
    func loadCollages() {
        self.containerView.delegate = self
        self.containerView.initializeCollageView(relativeFrames: self.collageItem?.relativeFrames ?? [String]())
        self.containerView.deleteView = deleteView
        for element in self.containerView.allElements {
            element.layer.borderColor = UIColor.black.cgColor
            element.layer.borderWidth = 1
        }
    }
    
    func didEnterDeleteView(collageElement: NBCollageElement, deleteView: UIView) {
        self.deleteView.backgroundColor = UIColor.red
    }
    
    func didLeaveDeleteView(collageElement: NBCollageElement, deleteView: UIView) {
        self.deleteView.backgroundColor = UIColor.white
    }
    
    func didDeleteImageInElement(collageElement: NBCollageElement) {
        self.deleteView.backgroundColor = UIColor.white
    }
    
    func didSelectCollageElement(element: NBCollageElement) {
        self.selectedElement = element
        
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        imagePickerController.imageLimit = 4
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        self.selectedElement?.addElementImage(image: images[0])
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
