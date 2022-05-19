//
//  Vehicle.swift
//
//  Created by Layla Michel
//  Created on 2022-05-17
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  This program checks and displays the car's info and can alter its speed
// and display it to an output text file.

import Foundation

class Vehicle {
    // Properties
    private var vehicleNum: String
    private var licensePlate: String
    private var colour: String
    private var doorsNum: String
    private var speed: String
    private var maxSpeed: String
    private var strArray: [String] = ["0", "0", "0", "0", "0", "0"]

    // Constructor
    init(carNum: String,
         carLicensePlate: String,
         carColour: String,
         carDoorsNum: String,
         carSpeed: String,
         carMaxSpeed: String) {
        vehicleNum = carNum
        licensePlate = carLicensePlate
        colour = carColour
        doorsNum = carDoorsNum
        speed = carSpeed
        maxSpeed = carMaxSpeed
    }

    // Accelerates the car by a specified km/h
    func accelerate(acceleration: String) {
        let accelerationInt: Int = Int(acceleration) ?? 0
        var speedInt: Int = Int(speed) ?? 0

        // Sets new speed value
        speedInt += accelerationInt
        speed = String(speedInt)
    }

    // Slows the car by a specified km/h
    func brake(deceleration: String) {
        let decelerationInt: Int = Int(deceleration) ?? 0
        var speedInt: Int = Int(speed) ?? 0

        // Sets new speed value
        speedInt -= decelerationInt
        speed = String(speedInt)
    }

    // Displays the car's current speed to the output text file
    func getSpeed() {
        // Adding string to array
        var stringArray: [String] = ["0"]
        stringArray[0] = "The current speed of vehicle "
            + "\(vehicleNum) is: \(speed) km/h."

        // Create string containing elements of the array
        // separated by a new line
        let joined = stringArray.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: "/home/runner/Unit3-06-Swift/output.txt")

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Vehicle \(vehicleNum)'s current speed is displayed"
            + " to 'output.txt'")
    }

    // Displays the car's max speed to the output text file
    func getMaxSpeed() {
        // Adding string to array
        var stringArray2: [String] = ["0"]
        stringArray2[0] = "The max speed of vehicle "
            + "\(vehicleNum) is: \(maxSpeed) km/h."

        // Create string containing elements of the array
        // separated by a new line
        let joined = stringArray2.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: "/home/runner/Unit3-06-Swift/output.txt")

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Vehicle \(vehicleNum)'s max speed is displayed "
            + "to 'output.txt'")
    }

    // Displays the car's information to the output text file
    func getInfo() {
        // Adding car's information to an array
        strArray[0] = "Vehicle \(vehicleNum)'s info"
        strArray[1] = "License plate: \(licensePlate)"
        strArray[2] = "Colour: \(colour)"
        strArray[3] = "Number of doors: \(doorsNum)"
        strArray[4] = "Speed: \(speed)"
        strArray[5] = "Max speed: \(maxSpeed)"

        // Create string containing elements of the array
        // separated by a new line
        let joined = strArray.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: "/home/runner/Unit3-06-Swift/output.txt")

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Vehicle \(vehicleNum)'s information is displayed"
            + " to 'output.txt'")
    }
}

do {
    if CommandLine.argc < 2 {
        // Error message if no file is inputted
        print("Error: Text file needed.")
    } else {
        // Read command line arguments for file name
        let arguments = CommandLine.arguments
        let file: String = arguments[1]

        let set = try String(contentsOfFile: file, encoding: String.Encoding.utf8)
        // Create array of the elements in the text file
        let stringArray: [String] = set.components(separatedBy: "\n")

        for vehicle in stringArray {
            // Create list of each element of the array
            var list = vehicle.components(separatedBy: " ")

            var counter = 0

            for string in list {
                if counter == 0 {
                    // Check if the car number is an integer
                    let carNumInt = Int(string) ?? -23847125624345235

                    if carNumInt == -23847125624345235 {
                        // Set the car number value to null if
                        // the input is invalid
                        list[counter] = "null"
                    }
                } else if counter == 1 {
                    // Check if a license plate was written
                    if string == "" {
                        // Set the license plate to XXX XXX
                        // if the field is empty
                        list[counter] = "XXX XXX"
                    }
                } else if counter == 3 {
                    // Check if the number of doors is an integer
                    let doorsNumInt = Int(string) ?? -23847125624345235

                    if doorsNumInt == -23847125624345235 {
                        // Set the door number value to "0"
                        // if the input is invalid
                        list[counter] = "0"
                    }
                } else if counter == 4 {
                    // Check if the speed is an integer
                    let speedInt = Int(string) ?? -23847125624345235

                    if speedInt == -23847125624345235 {
                        // Set the speed value to "0"
                        // if the input is invalid
                        list[counter] = "0"
                    }
                } else if counter == 5 {
                    // Check if the max speed is an integer
                    let maxSpeedInt = Int(string) ?? -23847125624345235

                    if maxSpeedInt == -23847125624345235 {
                        // Set the max speed value to "0"
                        // if the input is invalid
                        list[counter] = "0"
                    }
                }
                counter += 1
            }
            // Create aVehicle object containing the information of each string
            let aVehicle = Vehicle(carNum: list[0],
                carLicensePlate: list[1],
                carColour: list[2],
                carDoorsNum: list[3],
                carSpeed: list[4],
                carMaxSpeed: list[5])

            // Get the current speed of the car
            aVehicle.getSpeed()

            // Get the max speed of the car
            aVehicle.getMaxSpeed()

            // Accelerate the car by 10 km/h
            aVehicle.accelerate(acceleration: "10")

            // Deceleration the car by 10 km/h
            aVehicle.brake(deceleration: "5")

            // Get the car's information
            aVehicle.getInfo()
        }
    }
} catch {
    // Error message if nonexistent file is inputted
    print("File does not exist.")
}
