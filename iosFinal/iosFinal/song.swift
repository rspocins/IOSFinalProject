//
//  song.swift
//  iosFinal
//
//  Created by Daria Czerniakiewicz on 3/16/26.
//
var mySongs: [song] = [

/*    song(name: "Hot N Cold", type: .pop, artist: "Katy Perry", album: "One of the Boys"),
    song(name: "Complicated", type: .pop, artist: "Avril Lavigne", album: "Let Go"),
    song(name: "Firework", type: .pop, artist: "Katy Perry", album: "Teenage Dream"),
    song(name: "Teenage Dream", type: .pop, artist: "Katy Perry", album: "Teenage Dream"),

    song(name: "A Milli", type: .rap, artist: "Lil Wayne", album: "Tha Carter III"),
    song(name: "Congratulations", type: .rap, artist: "Post Malone", album: "Stoney"),
    song(name: "Cars Bring Me Out", type: .rap, artist: "Future", album: "HNDRXX"),
    song(name: "Mean to Me", type: .rap, artist: "lil Durk", album: "HNDRXX"),

    song(name: "Calm Before the Storm", type: .rock, artist: "Fall Out Boy", album: "Take This to Your Grave"),
    song(name: "High Voltage", type: .rock, artist: "Linkin Park", album: "Meteora"),
    song(name: "Don't Stay", type: .rock, artist: "Linkin Park", album: "Meteora"),
    song(name: "The River", type: .rock, artist: "Good Charlotte", album: "Good Morning Revival"),

    song(name: "Joe Rogan Experience #2468", type: .podcast, artist: "Joe Rogan", album: "The Joe Rogan Experience"),
    song(name: "Ask Neil Anything – January 2026", type: .podcast, artist: "Neil deGrasse Tyson", album: "StarTalk"),
    song(name: "Theo Von #646", type: .podcast, artist: "Theo Von", album: "This Past Weekend"),
    song(name: "Theo Von #646 Soul Boom", type: .podcast, artist: "Rain Wilson", album: "Rain gets roasted by Zach"),
*/
    ]
//hot&cold, complicated, firework, teenage dream
// a millie, congratulations, cars bring me out, mean to me
// calm before the storm,high volatage, dont stay, the river
//joe rogan experience #2468, ask neil anything january 2026,Theo VON #646 soul boom
import Foundation
class song{
    enum `Type` : String{
        case pop = "pop"
        case rap = "rap"
        case rock = "rock"
        case podcast = "podcast"
    }
    var name : String
    var type : Type
    var artist: String
    var long : Double
    var lat : Double
    var date : String
    init(name: String, type: Type, artist: String, long: Double, lat: Double, date: String) {
        self.name = name
        self.type = type
        self.artist = artist
        self.long = long
        self.lat = lat
        self.date = date
    }
}
