//
//  MainTabBar.swift
//  SideMenu
//
//  Created by Engy on 11/6/24.
//


import UIKit

class MainTabBar: UITabBarController {

    @IBOutlet var leftButton: UIBarButtonItem!
    @IBOutlet var rightButton: UIBarButtonItem!

    var showLeftSlideMenu: Bool = false
    var showRightSlideMenu: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func leftButtonClicked(_ sender: UIBarButtonItem) {
        showLeftSlideMenu.toggle()

        if showLeftSlideMenu {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") {
                vc.modalPresentationStyle = .overCurrentContext
                vc.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)

                self.present(vc, animated: false) {
                    let screenWidth = self.view.frame.width
                    let viewWidth = screenWidth * 0.7
                    let viewHeight = self.view.frame.height * 0.9
                    vc.view.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
                }
            }
        } else {
            if let presentedVC = presentedViewController, presentedVC is SettingsViewController {
                presentedVC.dismiss(animated: false)
            }
        }
    }

    @IBAction func rightButtonClicked(_ sender: UIBarButtonItem) {

        showRightSlideMenu.toggle()

        if showRightSlideMenu {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") {
                vc.modalPresentationStyle = .overCurrentContext
                vc.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)

                // Present the view controller
                self.present(vc, animated: false) {
                    let screenWidth = self.view.frame.width
                    let viewWidth = screenWidth * 0.7
                    let viewHeight = self.view.frame.height * 0.9
                    let x =  screenWidth * 0.3
                    vc.view.frame = CGRect(x: x, y: 0, width: viewWidth, height: viewHeight)
                }
            }
        } else {
            if let presentedVC = presentedViewController , presentedVC is SettingsViewController {
                presentedVC.dismiss(animated: false)

            }
        }
    }

}




