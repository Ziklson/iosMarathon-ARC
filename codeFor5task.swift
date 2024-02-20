// class Singer {
//     func playSong() {
//         print("Shake it off!")
//     }
// }
///
// First Version not modified
///
// func sing() -> () -> Void {            // Work pretty good
//     let taylor = Singer()

//     let singing = {
//         taylor.playSong()
//         return
//     }

//     return singing
// }


///////////////////////////////////////////
// Modify
/////////////////////////////////////////// 

// func sing() -> () -> Void { // Not Working give an error
//     let taylor = Singer()

//     let singing = { [weak taylor] in
//         taylor?.playSong()
//         return
//     }

//     return singing
// }

//////////////////////////////////

// func sing() -> () -> Void { ///////// Give an error
//     let taylor = Singer()

//     let singing = { [weak taylor] in
//         taylor!.playSong()
//         return
//     }

//     return singing
// }


// func sing() -> () -> Void { // Also not working
//     let taylor = Singer()

//     let singing = { [unowned taylor] in
//         taylor.playSong()
//         return
//     }

//     return singing
// }

// let singFunction = sing()
// singFunction()



/////////

// class House {
//     var ownerDetails: (() -> Void)?

//     func printDetails() {
//         print("This is a great house.")
//     }

//     deinit {
//         print("I'm being demolished!")
//     }
// }

// class Owner {
//     var houseDetails: (() -> Void)?

//     func printDetails() {
//         print("I own a house.")
//     }

//     deinit {
//         print("I'm dying!")
//     }
// }

// print("Creating a house and an owner")

// do {
//     _ = House()  // here output throws warning so i just remove let house and put _
//     _ = Owner()  // same as previous line
// }

// print("Done")


/// And now create Strong Reference Cicle
// Deinit not called this time

// print("Creating a house and an owner")

// do {
//     let house = House()
//     let owner = Owner()
//     house.ownerDetails = owner.printDetails
//     owner.houseDetails = house.printDetails
// }

// print("Done")

/// Lets Fix this

/// Now everything FINE
// print("Creating a house and an owner")

// do {
//     let house = House()
//     let owner = Owner()
//     house.ownerDetails = { [weak owner] in owner?.printDetails() }
//     owner.houseDetails = { [weak house] in house?.printDetails() }
// }

// print("Done")

/// Going back to Sing


class Singer {
    init() {
        playSong()
    }

    func playSong() {
        print("Shake it off!")
    }
}


// func sing() -> () -> Void {
//     let taylor = Singer()
//     let adele = Singer()

//     let singing = { [unowned taylor, adele] in
//         taylor.playSong()
//         adele.playSong()
//         return
//     }

//     return singing
// }


// let singFunction = sing()
// singFunction()

var numberOfLinesLogged = 0

let logger1 = {
    numberOfLinesLogged += 1
    print("Lines logged: \(numberOfLinesLogged)")
}

logger1()

let logger2 = logger1
logger2()
logger1()
logger2()



