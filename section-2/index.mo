import Text "mo:base/Text";
import Nat "mo:base/Nat";
// 2.10
// Object and Classes
let newObject = object {
    private let a : Text = "Hello";
    public let number : Nat = 20;
};
// The type for the above oject is {number : Nat}
// example

type objType = {
    y : Nat;
};
let obj : objType = object {
    private var number = 2410;
    public let y = 21;
};

// ! The values of the variables inside objects (and inside records as well) could also be a function

let obj2 = object {
    private let number = 9236;
    public func getNumber() : Nat {
        number
    };
};

let obj3 = object {
    private func f() {};
    public let x = f;
};
// The type of obj3 is {x : () -> () }
let callObjFunc = obj3.x(); // Actually calling the function
let refObjFunc = obj3.x;  // Only referencing the function
    refObjFunc();  // Now calling the function


let balance = object {
    private let initialBalance = 100;

    public var balance = initialBalance;

    public func addAmount( amount : Nat ) : Nat {
        balance += amount;
        balance
    };
};

// The type of this object is 
// {
//     var balance : Nat;
//     addAmount : Nat -> Nat
// }








// 2.10.2
// Classes
// It is just like a function, takes input and also gives a return
// ! Important point to note - classes also return an " object "
// Means -
// type SomeObject = {};
// type SomeClass = () -> SomeObject;
// In class we can use public / private
//! Instead of using func we have a special notation " class "
class MyClass() {
    private let a = 0;
    public let b = 1;
};

// Creating the instance of the class

let instanceOfClass : returnObj = MyClass();

// We can set the type of the object returned by the class
type returnObj = {
    b : Nat;
};

