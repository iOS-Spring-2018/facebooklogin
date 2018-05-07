//
//  ViewController.swift
//  FacebookLoginPrep
//
//  Created by Jon Eikholm on 06/05/2018.
//  Copyright © 2018 Jon Eikholm. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print(15)
        self.getFBUserData()
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print(19)
    }
    
 var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        loginButton.delegate = self
        //adding it to view
        view.addSubview(loginButton)
        
        //if the user is already logged in
        if let accessToken = FBSDKAccessToken.current(){
            getFBUserData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //when login button clicked
//    @objc func loginButtonClicked() { // this method is NOT called.
//        print("LINE 40")
//        let loginManager = LoginManager()
//        loginManager.logIn(readPermissions: [ .publicProfile ], viewController: self) { loginResult in
//            switch loginResult {
//            case .failed(let error):
//                print(error)
//            case .cancelled:
//                print("User cancelled login.")
//            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
//                self.getFBUserData()
//            }
//        }
//    }
    
    //function is fetching the user data
    func getFBUserData(){
        print("56")
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }


}

