//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Alex Quiton on 12/24/23.
//

import Foundation
import AVFoundation
import UIKit

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
}

final class ScannerVC: UIViewController{
    
    let captureSession = AVCaptureSession() //captures from the camera
    var previewLayer: AVCaptureVideoPreviewLayer? //previews what the camera sees
    weak var scannerDelegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate){
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") //catches error
    }
    
    //checks to see if we can use & if we have a camera & type of barcode we are scanning
    
    private func setupCaptureSession(){
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else //do we have a device that can capture video
        {
            return
        }
        let videoInput: AVCaptureDeviceInput
        
        do{
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput){
            captureSession.addInput(videoInput)
        }else{
            return
        }
        
        let metaDataOuput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOuput){
            captureSession.addOutput(metaDataOuput)
            metaDataOuput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOuput.metadataObjectTypes = [.ean8, .ean13]
        }else{
            return
        }
     
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) // setup our preview layer to show our capture session
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else{
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else{
            return
        }
        
        scannerDelegate?.didFind(barcode: barcode)
    }
}
