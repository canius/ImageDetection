//
//  ViewController.swift
//  ImageDetection
//
//  Created by canius.chu on 21/4/2017.
//  Copyright © 2017 EF. All rights reserved.
//

import UIKit
import AVFoundation
import GPUImage

class ViewController: UIViewController {

    var camera: Camera!
    @IBOutlet weak var renderView: RenderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            camera = try Camera(sessionPreset:AVCaptureSessionPreset640x480)
            let filter = ShiTomasiFeatureDetector()
            camera --> filter --> renderView
            camera.startCapture()
        } catch {
            fatalError("Could not initialize rendering pipeline: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

