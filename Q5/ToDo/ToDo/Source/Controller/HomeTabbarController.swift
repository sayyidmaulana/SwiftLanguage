//
//  HomeTabbarController.swift
//  ToDo
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import UIKit

class HomeTabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstTabbar = ViewController()
        let firstController = UINavigationController(rootViewController: firstTabbar)
        let berandaItem:UITabBarItem = UITabBarItem(title: "Task", image: UIImage(named: "Icon")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Icon"))
        firstController.tabBarItem = berandaItem
        
        let secondTabbar = ViewControllerTwo()
        let secondController = UINavigationController(rootViewController: secondTabbar)
        let thornItem:UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Icon-2")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Icon-2"))
        secondController.tabBarItem = thornItem
        
        let thirdTabbar = ViewControllerThree()
        let thirdController = UINavigationController(rootViewController: thirdTabbar)
        let aboutItem:UITabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "Icon-3")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Icon-3"))
        thirdController.tabBarItem = aboutItem

        viewControllers = [firstController, secondController, thirdController]
        navigationController?.navigationBar.isTranslucent = false
    }

}
