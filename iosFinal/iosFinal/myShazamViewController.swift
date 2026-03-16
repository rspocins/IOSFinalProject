//
//  myShazamViewController.swift
//  iosFinal
//
//  Created by Daria Czerniakiewicz on 3/15/26.
//

import UIKit
import ShazamKit
import AVFoundation
import CoreLocation

var songID = 0;
class myShazamViewController: UIViewController, SHSessionDelegate, CLLocationManagerDelegate {
    let locManager = CLLocationManager()
    let audioEngine = AVAudioEngine()
    let session = SHSession()
    let signatureGenerator = SHSignatureGenerator()
    var currLat : Double?
    var currLong : Double?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session.delegate = self
        
        locManager.delegate = self
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()

    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        currLat = location.coordinate.latitude
        currLong = location.coordinate.longitude
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
            var songName = "song \(songID)";
            var artistName = "artist \(songID)";
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatter.string(from: Date())
            
            songID+1;
            mySongs.append(song(name: songName, type: .rock, artist: artistName, long: self.currLong ?? 0.0, lat: self.currLat ?? 0.0, date: dateString ))
            
//            init(name: String, type: Type, artist: String, long: String, lat: String, date: String) {
        }
    }
    
//    let mySongs: [song] = [
//
//        song(name: "Hot N Cold", type: .pop, artist: "Katy Perry", album: "One of the Boys"),
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
