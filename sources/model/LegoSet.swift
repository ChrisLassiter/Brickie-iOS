//
//  LegoSet.swift
//  BrickSet
//
//  Created by Work on 02/05/2020.
//  Copyright © 2020 LEOLELEGO. All rights reserved.
//

import Foundation
//import RealmSwift
let fomatter : NumberFormatter = {
    let f = NumberFormatter()
    f.numberStyle = .currency
    return f
}()
class LegoSet : Codable , Equatable,Hashable{
    var setID : Int = 0
    var number : String = ""
    var name : String = ""
    var year : Int = 0
    
    var theme : String = ""
    var themeGroup : String = ""
    var subtheme : String? = ""
    var category : String = ""
    var released : Bool = true
    var pieces : Int = 0
    let minifigs : Int?
    let image : LegoSetImage
    let bricksetURL : String
    var collection : LegoSetCollection
    let rating : Float
    let instructionsCount : Float
    let LEGOCom : [String:LegoSetPrice]

    var price : String? {
        return fomatter.string(for: LEGOCom["US"]?.retailPrice) 
    }
    
    static func == (lhs: LegoSet, rhs: LegoSet) -> Bool {
        return lhs.setID == rhs.setID
    }
    func hash(into hasher: inout Hasher) {
       hasher.combine(name)
       hasher.combine(number)
       hasher.combine(year)
     }
}
extension LegoSet : Identifiable {
    var id: Int {setID}
}
extension LegoSet : ObservableObject{}



struct LegoSetImage : Codable {
    var thumbnailURL : String
    var imageURL : String
}
class LegoSetCollection : Codable {
    var owned : Bool
    var wanted : Bool
    var qtyOwned : Int
    var rating : Float
    var notes = ""
}

struct LegoSetPrices : Codable {
    let US : LegoSetPrice?
    let UK : LegoSetPrice?
    let CA : LegoSetPrice?
    let DE : LegoSetPrice?
}
struct LegoSetPrice : Codable {
    let retailPrice : Float?
}

struct LegoInstruction : Codable {
    let URL : String
    let description : String
}
