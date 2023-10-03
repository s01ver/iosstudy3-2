//
//  ViewController.swift
//  iosstudy3-2
//
//
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLabelDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        person.fly()
        person.run()
    }

    let person = Person()
}

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

class Person : Flyable, Runnable {
    func fly() {
        print("날았다.")
    }
    
    func run() {
        print("달렸다.")
    }
}
