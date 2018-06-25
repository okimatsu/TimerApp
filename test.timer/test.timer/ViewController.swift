import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var timer: Timer?
    var currentSeconds = 0
    
    
    
    @IBOutlet weak var timerLavel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func button10(_ sender: UIButton) {
        start(seconds:  10)
    }
    @IBAction func button3(_ sender: UIButton) {
        start(seconds: 180)
    }
    @IBAction func button5(_ sender: UIButton) {
        start(seconds: 300)
    }
    
   @objc func update() {
        currentSeconds -= 1
        timerLavel.text = "残り\(currentSeconds)秒"
        if (currentSeconds == 0) {
            timer?.invalidate()
            let soundId: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundId)
        }
    }
    
 func start(seconds: Int) {
        currentSeconds = seconds
        timerLavel.text = "残り\(currentSeconds)秒"
    timer = Timer.scheduledTimer (timeInterval: 1.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    
    
    
}



