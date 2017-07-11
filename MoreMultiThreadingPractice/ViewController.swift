
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    @IBAction func button1Pressed(_ sender: UIButton) {
        
        updateImage(button: 1)
    }
    @IBAction func button2Pressed(_ sender: UIButton) {
        updateImage(button: 2)
    }
    @IBAction func button3Pressed(_ sender: UIButton) {
        
        updateImage(button: 3)
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func updateImage(button: Int) {
        var imgUrl = URL(string: "")
        switch button {
        case 1:
            imgUrl = URL(string: "http://gallery-wallpapers.net/picture/button_blue_drawing_82431.html")
        case 2:
            imgUrl = URL(string: "http://upload.wikimedia.org/wikipedia/commons/d/d9/Arduino_ftdi_chip-1.jpg")
        case 3:
            imgUrl = URL(string: "http://www.walldevil.com/wallpapers/w03/871688-circuits-computer-technology-electronics-pcb.jpg")
        default:
            break
            
            
        }
        
        DispatchQueue.global(qos: DispatchQoS.userInitiated.qosClass).async {
            let fetch = NSData(contentsOf: imgUrl! as URL)
            DispatchQueue.main.async {
                if let imgDta = fetch {
                    self.myImage.image = UIImage(data: imgDta as Data)
                }
            }
        
        }

        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

