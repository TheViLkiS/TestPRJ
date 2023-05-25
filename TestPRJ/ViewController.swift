//
//  ViewController.swift
//  TestPRJ
//
//  Created by Дмитрий Гусев on 23.05.2023.
//

import UIKit



class ViewController: UIViewController {
    var button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
        self.title = "vc 1"
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        initButton()
        
    }
    
    func initButton() {
        
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        view.addSubview(button)
    }
    
    @objc func pressAction() {
    let vc = TwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
}

class TwoViewController: UIViewController {
    var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "vc 2"
        view.backgroundColor = .white
        
        loadFoto()
        
//        let imageUrl = URL(string: "https://thumbs.dreamstime.com/z/grunge-green-accepted-word-square-rubber-seal-stamp-white-background-grunge-green-accepted-word-square-rubber-seal-stamp-139591946.jpg")!
//
//        if let data = try? Data(contentsOf: imageUrl) {
//            self.image.image = UIImage(data: data)
//            print("image")
//        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initImage()
    }
    
    func initImage() {
        image.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        image.center = view.center
        view.addSubview(image)
    }
    
    func loadFoto() {
        
        let imageUrl = URL(string: "https://thumbs.dreamstime.com/z/grunge-green-accepted-word-square-rubber-seal-stamp-white-background-grunge-green-accepted-word-square-rubber-seal-stamp-139591946.jpg")!
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
                    }
        }
        
    }

}


let vc = ViewController()

let navBar = UINavigationController(rootViewController: vc)


