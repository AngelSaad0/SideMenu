//
//  SecondTabBar.swift
//  SideMenu
//
//  Created by Engy on 11/6/24.
//

import UIKit

class SecondTabBar: UITabBarController {

    @IBOutlet var leftButton: UIBarButtonItem!
    @IBOutlet var rightButton: UIBarButtonItem!

    var showLeftSlideMenu = false
    var showRightSlideMenu = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func leftButtonClicked(_ sender: UIBarButtonItem) {
        toggleSlideMenu(isLeftMenu: true)
    }

    @IBAction func rightButtonClicked(_ sender: UIBarButtonItem) {
        toggleSlideMenu(isLeftMenu: false)
    }

    private func toggleSlideMenu(isLeftMenu: Bool) {
        //true
        let shouldShowMenu = isLeftMenu ? !showLeftSlideMenu : !showRightSlideMenu

        if shouldShowMenu {
            presentSlideMenu(isLeftMenu: isLeftMenu)
            if isLeftMenu {
                showLeftSlideMenu = true
            } else {
                showRightSlideMenu = true
            }
        } else {
            dismissSlideMenu()
            if isLeftMenu {
                showLeftSlideMenu = false
            } else {
                showRightSlideMenu = false
            }
        }
    }

    private func presentSlideMenu(isLeftMenu: Bool) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") else { return }

        vc.modalPresentationStyle = .overCurrentContext
        vc.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)

        self.present(vc, animated: false) {
            let screenWidth = self.view.frame.width
            let viewWidth = screenWidth * 0.7
            let viewHeight = self.view.frame.height * 0.9
            let xPosition: CGFloat = isLeftMenu ? 0 : screenWidth * 0.3
            vc.view.frame = CGRect(x: xPosition, y: 0, width: viewWidth, height: viewHeight)
        }
    }

    private func dismissSlideMenu() {
        if let presentedVC = presentedViewController, presentedVC is SettingsViewController {
            presentedVC.dismiss(animated: false)
        }
    }
}
