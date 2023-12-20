//
//  ViewController.swift
//  SwiftGetIP
//
//  Created by Angelos Staboulis on 20/12/23.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var txtURL: NSTextField!
    @IBOutlet weak var txtIP: NSTextField!
    var result:UnsafeMutablePointer<addrinfo>? = nil
    var hname:UnsafeMutablePointer<CChar>?
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        // Do any additional setup after loading the view.
    }
    func getIP(){
            getaddrinfo(self.txtURL.stringValue, nil, nil,&self.result)
            self.hname = UnsafeMutablePointer.allocate(capacity: Int(NI_MAXHOST))
            defer{
                self.hname?.deallocate()
            }
            getnameinfo(self.result!.pointee.ai_addr, self.result!.pointee.ai_addrlen, self.hname,UInt32(NI_MAXHOST),nil, 0,0)
            self.txtIP.stringValue =  String(cString: self.hname!)
    }
    @IBAction func CmdGetIP(_ sender: Any) {
        getIP()
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

