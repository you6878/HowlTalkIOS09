//
//  ChatViewController.swift
//  HowlTalk
//
//  Created by 유명식 on 2017. 9. 26..
//  Copyright © 2017년 swift. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    
    
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    public var destinationUid :String? // 나중에 내가 채팅할 대상의 uid
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createRoom(){
        let createRoomInfo = [
            "uid":Auth.auth().currentUser?.uid,
            "destinationUid" : destinationUid
        ]
        
        Database.database().reference().child("chatrooms").childByAutoId().setValue(createRoomInfo)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
