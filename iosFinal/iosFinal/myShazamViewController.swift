//
//  myShazamViewController.swift
//  iosFinal
//
//  Created by Daria Czerniakiewicz on 3/15/26.
//

import UIKit
import ShazamKit
import AVFoundation

class myShazamViewController: UIViewController, SHSessionDelegate {
    let audioEngine = AVAudioEngine()
    let session = SHSession()
    let signatureGenerator = SHSignatureGenerator()
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session.delegate = self
        startListening()

    }
    @IBAction func doSomething(_ sender: Any) {
        let signature = signatureGenerator.signature()
        session.match(signature)
    }
    func startListening(){
        let inputNode = audioEngine.inputNode
        let format = inputNode.outputFormat(forBus: 0)
        
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format){ buffer, audioTime in
            do{
                try self.signatureGenerator.append(buffer, at: audioTime)
            }catch{
                print("failed to append to audioBuffer\(error)")
            }
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.record,mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioEngine.start()
            print("listening...")
        }catch {
            print( "audio engine coudnt start \(error)")
        }
    }
    func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?){
        if let error = error{
            print ("No match / error \(error)")
        }else {
            print ("no match found.")
        }
            /*
             // MARK: - Navigation
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
    }
}
