struct Car: Hashable {
    var brand: String 
    var year: Int 
    var trunkCapacity: Double 
    var engineIsOn: Bool 
    var windowsAreOpen: Bool
    var trunkLoad: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(year)
        hasher.combine(trunkCapacity)
        hasher.combine(engineIsOn)
        hasher.combine(windowsAreOpen)
        hasher.combine(trunkLoad)
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.brand == rhs.brand && lhs.year == rhs.year && lhs.trunkCapacity == rhs.trunkCapacity && lhs.engineIsOn == rhs.engineIsOn && lhs.windowsAreOpen == rhs.windowsAreOpen && lhs.trunkLoad == rhs.trunkLoad
    }
}

struct Truck: Hashable {
    var brand: String
    var year: Int
    var bodyCapacity: Double
    var engineIsOn: Bool
    var windowsAreOpen: Bool 
    var bodyLoad: Double
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(year)
        hasher.combine(bodyCapacity)
        hasher.combine(engineIsOn)
        hasher.combine(windowsAreOpen)
        hasher.combine(bodyLoad)
    }
    
    static func == (lhs: Truck, rhs: Truck) -> Bool {
        return lhs.brand == rhs.brand && lhs.year == rhs.year && lhs.bodyCapacity == rhs.bodyCapacity && lhs.engineIsOn == rhs.engineIsOn && lhs.windowsAreOpen == rhs.windowsAreOpen && lhs.bodyLoad == rhs.bodyLoad
    }
    
}

enum CarAction {
    case startEngine
    case stopEngine 
    case openWindows
    case closeWindows 
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
}

extension Car {
    mutating func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            engineIsOn = true
        case .stopEngine:
            engineIsOn = false 
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        case .loadCargo(let volume):
            guard trunkLoad + volume <= trunkCapacity else {
                print("There's no trunk space")
                return
            }
            trunkLoad += volume
        case .unloadCargo(let volume):
            guard trunkLoad - volume >= 0 else {
                print("There's not that much cargo in the trunk")
                return
            }
            trunkLoad -= volume
        }
    }
}

extension Truck {
    mutating func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            engineIsOn = true
        case .stopEngine:
            engineIsOn = false
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false 
        case .loadCargo(let volume):
            guard bodyLoad + volume <= bodyCapacity else {
                print("There's no body space")
                return
            }
            bodyLoad += volume
        case .unloadCargo(let volume):
            guard bodyLoad - volume >= 0 else {
                print("There's not that much cargo in the body")
                return
            }
            bodyLoad -= volume
        }
    }
}

var car1 = Car(brand: "Toyota", year: 2010, trunkCapacity: 500, engineIsOn: false, windowsAreOpen: false, trunkLoad: 0)
var car2 = Car(brand: "Ford", year: 2015, trunkCapacity: 400, engineIsOn: true, windowsAreOpen: true, trunkLoad: 100)
var truck1 = Truck(brand: "Volvo", year: 2018, bodyCapacity: 10000, engineIsOn: false, windowsAreOpen: false, bodyLoad: 5000)
var truck2 = Truck(brand: "MAN", year: 2020, bodyCapacity: 8000, engineIsOn: true, windowsAreOpen: true, bodyLoad: 3000)

car1.performAction(.startEngine) 
car2.performAction(.closeWindows) 
truck1.performAction(.loadCargo(volume: 2000)) 
truck2.performAction(.unloadCargo(volume: 1000)) 

var dict = [car1: "car1", car2: "car2", truck1: "truck1", truck2: "truck2"] as [AnyHashable: String]

print("This is the console output: \(dict as AnyObject)")
