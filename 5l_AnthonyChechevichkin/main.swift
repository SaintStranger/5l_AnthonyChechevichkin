//
//  main.swift
//  5l_AnthonyChechevichkin
//
//  Created by Антон Чечевичкин on 15.09.2020.
//  Copyright © 2020 Антон Чечевичкин. All rights reserved.
//

import Foundation

protocol Car {
    var doorsNumber: Int {get}
    var speed: Double {get}
    var wheels: Int {get}
    
    func checkDoors() -> Bool
    func checkStatus()
}

extension Car {
    
    func wheelStatus() -> Bool {
        if wheels >= 4 {
            return true
        } else {
            return false
        }
    }
    
    func engineStatus() -> Bool {
        
        if speed > 0 {
            return true
        } else {
            return false
        }
    }
}

class SportCar: Car {
    
    var doorsNumber: Int
    var speed: Double
    var wheels: Int
    var topSpeed: Double
    
    init(doorsNumber: Int, speed: Double, wheels: Int, topSpeed: Double) {
        self.doorsNumber = doorsNumber
        self.speed = speed
        self.wheels = wheels
        self.topSpeed = topSpeed
    }
    
    func checkDoors() -> Bool {
        if doorsNumber == 2 || doorsNumber == 4 {
            return true
        } else {
            return false
        }
    }
    
    func checkStatus() {
        if checkDoors() == true && engineStatus() == true && wheelStatus() == true && topSpeed >= 220 {
            print("Следи за дорогой! Скорость \(topSpeed)!")
        } else if checkDoors() == true && engineStatus() == true && wheelStatus() == true && topSpeed <= 220 {
            print("Машина едет, но быстрой ее не назовешь")
        } else if engineStatus() == false {
            print("А двигатель?!")
        } else {
            print("Приехали...")
        }
    }
    
}

class SedanCar: Car {
    var doorsNumber: Int
    var speed: Double
    var wheels: Int
    var safetyPillows: Bool
    
    init(doorsNumber: Int, speed: Double, wheels: Int, safetyPillows: Bool ) {
        self.doorsNumber = doorsNumber
        self.speed = speed
        self.wheels = wheels
        self.safetyPillows = safetyPillows
    }
    
    func checkDoors() -> Bool {
        if doorsNumber == 4 {
            return true
        } else {
            return false
        }
    }
    
    func checkStatus() {
        if checkDoors() == true && engineStatus() == true && wheelStatus() == true && safetyPillows == true {
            print("Бери седан, поехали на пикник")
        } else if checkDoors() == true && engineStatus() == true && wheelStatus() == true && safetyPillows == false {
            print("Возьми подушку хотя бы из дома")
        } else if engineStatus() == false {
            print("Перед включением проверь подушки")
        } else {
            print("Приехали...")
        }
    }
}

class TrunkCar: Car {
    var doorsNumber: Int
    var speed: Double
    var wheels: Int
    var maxCapacity: Double
    
    init(doorsNumber: Int, speed: Double, wheels: Int, maxCapacity: Double) {
        self.doorsNumber = doorsNumber
        self.speed = speed
        self.wheels = wheels
        self.maxCapacity = maxCapacity
    }
    
    func checkDoors() -> Bool {
        if doorsNumber == 2{
            return true
        } else {
            return false
        }
    }
    
    func checkStatus() {
        if checkDoors() == true && engineStatus() == true && wheelStatus() == true && maxCapacity >= 100 {
            print("Места много? грузи больше")
        } else if checkDoors() == true && engineStatus() == true && wheelStatus() == true && maxCapacity <= 100 {
            print("И это все?")
        } else if engineStatus() == false {
            print("Дорога ждет? заводи мотор")
        } else {
            print("Перегруз...")
        }
    }
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Шумахер отдыхает"
    }
}

extension SedanCar: CustomStringConvertible {
    var description: String {
        return "Зато машина с подушками. Возможно"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Все свое вожу с собой"
    }
}

var ferrari = SportCar(doorsNumber: 2, speed: 120, wheels: 4, topSpeed: 200)
var peterBilt = TrunkCar(doorsNumber: 2, speed: 60, wheels: 4, maxCapacity: 220)
var volvo = SedanCar(doorsNumber: 4, speed: 80, wheels: 4, safetyPillows: true)

print(ferrari)
print(peterBilt)
print(volvo)

ferrari.checkStatus()

