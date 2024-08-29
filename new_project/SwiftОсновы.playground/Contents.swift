import UIKit

// MARK: Variable and Constant

var greeting = "Hello, playground"
let constantNumber: Int = 10
// constantNumber = 11 // Error: Cannot assign to value: 'constantNumber' is a 'let' constant
print(constantNumber)

var age: Int
age = 33

// MARK: Type

var name = "Rinat"
print(type(of: name))


// MARK: Operators and if statement

let userAge = 12
if userAge >= 18 {
    print("Access allowed")
} else if userAge >= 14 {
    print("Access allowed but ask your parents first")
} else {
    print("Access denied")
}


// MARK: Collection types

// Array

var integers: [Int] = []
var integers2 = Array(repeating: 1, count: 4)

integers.append(5)
print(integers)

var array2 = [4, 5]

var array3 = integers + array2
print(array3)

print(array3.count)
print(array3.isEmpty)

print(array2[0])

array2.insert(10, at: 0)
print(array2)

array2.remove(at: 2)
print(array2)


// SETS

var letters = Set<Character>()
print(letters.count)
letters.insert("f")
letters.insert("p")
letters.insert("m")
letters.insert("c")
letters.insert("f")
print(letters)

var set: Set<String> = ["b", "d", "i"]
/// .count  .isEmpty  .contains  .remove
/// .intersection  .symmetricDifference  .union  .subtracting  .isSubset


// MARK: LOOPS

/// Controll flow (if, guard, switch, loops: for-in, while) — контроль исполнени кода

// FOR-IN

let users = ["user1", "harryPotter", "John"]

for user in users {
    print("Hi, \(user)")
}

let usersAndAge = ["user1": 18, "harryPotter": 40, "John": 12]

for (userName, userAge) in usersAndAge {
    print("\(userName), you are \(userAge) years ago")
}

for num in 1...5 {
    // ...
}

// WHILE loop

var countdown = 10

while countdown > 0 {
    print("До нового года \(countdown) секунд")
    countdown -= 1
}

print("Happy New Year!!!")


// MARK: Dictionaries

//var usersAndYearOfBirth: [String: Int] = [:]

var usersAndYearOfBirth: [String: Int] = ["user1": 1999, "user2": 1980, "user3": 2004]

print(usersAndYearOfBirth.keys)
print(usersAndYearOfBirth.values)
print(usersAndYearOfBirth["user1"])
print(usersAndYearOfBirth.count)

if !usersAndYearOfBirth.isEmpty {
    print("Dictionary is not empty")
}

usersAndYearOfBirth["user4"] = 1968
print(usersAndYearOfBirth)

usersAndYearOfBirth.updateValue(1969, forKey: "user4")
print(usersAndYearOfBirth)

usersAndYearOfBirth.removeValue(forKey: "user4")
print(usersAndYearOfBirth)

// for-in

for year in usersAndYearOfBirth.values {
    print(year)
}


// MARK: Optionals

// nill

var userName: String? = nil
/// var userName: String = nil      // 'nil' cannot initialize specified type 'String'
print(userName)

userName = "Rinat"
print(userName)

print("------")

struct User {
    var userName: String? = "Rinat"
    var email: String = "testEmail@gmail.com"
}

print(User().userName)

// Optional Extraction
// 1. !
print(User().userName!)

// 2. if let / guard let
if let name = User().userName {
    print(name)
} else {
    //...
}

guard let name2 = User().userName else { fatalError("Error") }

//3. Chaining
let textField: UITextField? = UITextField()
//textField?.text = "test"
print(textField?.text ?? "")

//4.
if User().userName == nil {
    //...
} else {
    print(User().userName)
}


// MARK: Functions

func sayHello(userName: String, userCountry: String) -> String {
    let greeting = "Hello, " + userName + " from " + userCountry
    return greeting
}

let result = sayHello(userName: "Rinat", userCountry: "Russia")
print(result)


// MARK: Struct and Class

// Struct

struct UserS {
    var name: String = "Rinat"
    var lastName = "Fazylov"
    var age: Int = 34
}

/// struct (enum) = value — значения скопированы

var user1 = UserS()
var user2 = user1
user2.name = "Igor"
print(user1.name, user2.name)

// Class

class Car {
    var brand = "Skoda"
    var year = 2009
    var price = 600_000
    
    init() {
        //...
    }
}

var car = Car()

// Inheritance — наследование только для классов

class NewCar: Car {
    //...
}

/// class = reference type — значения имеют ссылочный тип

var car1 = Car()
var car2 = car1
car2.brand = "BMW"
print(car1.brand, car2.brand)

class Store {
    var name: String
    var year: Int
    var numberOfProduct: Int
    
    init(name: String, year: Int, numberOfProduct: Int) {
        self.name = name
        self.year = year
        self.numberOfProduct = numberOfProduct
    }
}

var store1 = Store(name: "Apple", year: 1980, numberOfProduct: 20)
var store2 = Store(name: "Microsoft", year: 1970, numberOfProduct: 23)


// MARK: Enum

enum SummerMonths {
    case june
    case july
    case august
}

var summerMonth = SummerMonths.july

switch summerMonth {
case .june:
    print("Hello, summer!")
case .august:
    print("Bye, summer!")
default:
    print("☀️") 
}

/*
 enum SummerMonths: CaseIterable {
 case june
 case july
 case august
 }
 
 print(SummerMonths.allCases.count)
 
 enum SummerMonths: String, CaseIterable {
 case june = "June
 case july
 case august
 }
 
 print(SummerMonths.june.rawValue) — выводит исходное значение
 */

// MARK: Protocols

protocol SomeProtocol {
    var nameP: String { get }
    func printName() -> String
}

/// в протокол можно добавить расширения:
extension SomeProtocol {
    func printName2() -> String {
        return "test"
    }
}

class SomeClass: SomeProtocol {
    var nameP: String = "Rinat"
    
    func printName() -> String {
        print("Hello, \(nameP)")
        return nameP
    }
    
}

var testClass = SomeClass()
testClass.printName()


// MARK: Access Control — контроль доступа

// Levels
// Open access, public
// Internal access — уровень доступа по-умолчанию
// File-private
// Private access

open class OpenClass {}
public class PublicClass {
    private var namePrivate = "Rinat"
}
internal class InternalClass {}
fileprivate class FilePrivateClass {}
private class PrivateClass {}

public var publicVar = 0
private func testFunction() {}
//print(namePrivate) //Cannot find 'namePrivate' in scope



// MARK: Closures — замыкания

func someFunc() {
    // body
}

//{ (parameters) -> Type in
//    // body
//}

//let printTest = { print("Hello world!") }

// или

// let printTest: () -> Void = { print("Hello world!") }
//                 ^            ^            ^
// можно добавить параметры:
let printTest: (String) -> Void = { (message: String) in print(message) }
printTest("Hello world")

print(printTest.self)

// Можно создать функцию, которая может принимать внутрь себя замыкания:
func performClosure(_ closure: @escaping () -> Void) {
    closure()
}
//@escaping — завершение


// MARK: Tuple

let userInfo = ("Rinat", 1990, true)
let http404Error = (404, "Not found")

var userData: (String, Int)
userData = ("Rinat", 34)
// or
var userData1: (name: String, age: Int)
userData1 = ("Rinat", 34)

print(userData1.name)
print(userData1.1) //по индексу


// MARK: Static
// MARK: Laziness — ленивые свойства или переменные

// Stored properties — хранимые свойства
// Computed — вычисляемые

class TestClass {
    static let singleton = TestClass()
    var nameClass: String = "Class name"
    
    func printNameClass() {
        print(nameClass)
    }
    
    static var staticName = "Static name"
    
    class func printNameStatic() {
        print("Static method")
    }
    
    lazy var testString: String = "Lazy text"
}

var testClassN = TestClass()
testClassN.testString

//testClassN.nameClass
//testClassN.printNameClass()

TestClass.staticName
TestClass.printNameStatic()
TestClass.singleton


// MARK: ARC — automatic reference counting — автоматический подсчет ссылок (ссылка как упоминание или использование чего-либо)

class MyClass {
    var name = "Test"
}

var myClass1 = MyClass()
myClass1.name // strong reference — сильная ссылка

