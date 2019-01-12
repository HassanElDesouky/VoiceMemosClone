//
//  RecordViewController.swift
//  VoiceMemosClone
//
//  Created by Hassan El Desouky on 1/12/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    //MARK:- Properties
    var handleView = UIView()
    var recordButton = RecordButton()

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHandelView()
        setupRecordingButton()
    }
    
    //MARK:- Setup Methods
    fileprivate func setupHandelView() {
        handleView.layer.cornerRadius = 2.5
        handleView.backgroundColor = UIColor(r: 208, g: 207, b: 205)
        view.addSubview(handleView)
        handleView.translatesAutoresizingMaskIntoConstraints = false
        handleView.widthAnchor.constraint(equalToConstant: 37.5).isActive = true
        handleView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        handleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        handleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        handleView.alpha = 0
    }
    
    fileprivate func setupRecordingButton() {
        recordButton.isRecording = false
        recordButton.addTarget(self, action: #selector(handleRecording(_:)), for: .touchUpInside)
        view.addSubview(recordButton)
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        //recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        recordButton.heightAnchor.constraint(equalToConstant: 65 ).isActive = true
    }
    
    //MARK:- Actions
    @objc func handleRecording(_ sender: RecordButton) {
        if recordButton.isRecording {
            handleView.alpha = 1
            view.frame = CGRect(x: 0, y: view.frame.height, width: view.bounds.width, height: -300)
            view.layoutIfNeeded()
        } else {
            handleView.alpha = 0
            view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 150)
            view.layoutIfNeeded()

        }
    }



}
