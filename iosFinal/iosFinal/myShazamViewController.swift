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

    }
    @IBAction func doSomething(_ sender: Any) {
        startListening()
        print("listening for 10 sec")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            
            self.audioEngine.stop()
            self.audioEngine.inputNode.removeTap(onBus: 0)
            
            let signature = self.signatureGenerator.signature()
            self.session.match(signature)
            print("finished listening matching song")
        }
    }
    func startListening(){
        do{
            let audiSession = AVAudioSession.sharedInstance()
            try audiSession.setCategory(.record, mode: .default)
            try audiSession.setActive(true)
            
            let inputNode = audioEngine.inputNode
            let format = inputNode.inputFormat(forBus: 0)
        
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format){ buffer, audioTime in
            do{
                try self.signatureGenerator.append(buffer, at: audioTime)
            }catch{
                print("failed to append to audioBuffer\(error)")
            }
        }
            
            audioEngine.prepare()
            try audioEngine.start()
            print("listening")
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
