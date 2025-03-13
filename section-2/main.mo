import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Result "mo:base/Result";
// 2.1 Variables
let variableName = 24;
let myCity = "Lucknow";
let temp = -2.1;
let isTrue = false;


// 2.2 Mutability
// To make the variable mutable - use " var " keyword
var name = "Jayesh";
// changing the name - 
name := "Krishna";

var city = "Lucknow";
city := "Guntur";
city := "Vijaywada";


// 2.3 Comments
/** 
 Multiline
 comment
**/


// 2.4 Types
let no : Nat = 24;
let myName : Text = "Jayesh Krishna";
let sahiHo : Bool = true;
// Also
let x : Bool = true : Bool;

// ? The Type keywork
type B = Bool;
let isDone : B = true;

// Special - Unit Type () - It's useful in several places, for example in functions to indicate that a function does not return any specific type.
let unitType : () = () : ();


// ? 2.4.1 - Tuples
type MyTuple = (Nat, Text);
let myTuple : MyTuple = (24, "Hello");
// To access the value from tuple
let text : Text = myTuple.1;


//? 2.4.2 - Records
// We can also give type to userDetail
type User = {
    var name : Text;
    age : Nat;
    gender : Text;
};
let userDetail : User = {
    var name = "Jayesh";
    age : Nat = 19;
    gender : Text = "M";
};

// Mutable record
let user2 : User = {
    var name = "Krishna";
    age = 20;
    gender = "M";
};

user2.name := "Jayesh";



//? 2.4.3  - Variants - A variant is a type that can take on one of a fixed set of values.
type myVariant = {
    #Black;
    #Blue;
    #Green;
    #Red;
};

let color : myVariant = #Red;

type Person = {
    #Male : Text;
    #Age : Nat;
};

let user : Person = #Male "Yes";
let user4 : Person = #Age(19);



// 2.4.4
// Immutable Arrays
let letters = ["one","two","three","four"];
type Letters = [Text];
let letter : Letters = ["a","b","c"];

// To access the value from the array
let firstLetter : Text = letter[0];
//? To get the size of the array
let sizeOfArr : Nat = letter.size();

//! An immutable array can be assigned to an mutable array.
var numbers : [Nat] = [1,2,3,4,5];
numbers := [7,8,6];

// WE can't do numbers[0] := 5959;
// If we want to do
// -> Create an mutale array using var
let moreNo : [var Nat] = [var 58,6,9,4,6];
moreNo[0] := 9999;


// Mutable variable with mutable array
var abc : [var Nat] = [var 89,5,6,47,5];


// 2.5 Operators
// 2.5.1 - Numberic Operators
// Addition (+) , Substraction (-), Multiply (*), Divide (/), Modulus (%), Exponentiation (**)
let no2 = (5+2) / 7;


// 2.5.2
// Relational Operator
// > , < , >= , <= , != , ==
let isGreater = 1 > 5;


// 2.5.3
//Assignment Operator
// := , += , -=, *= , **= , %= , /=
var num : Int = 5;
num += 10;

// 2.5.4 
// Text concatenation - #
let s : Text = "Hello" # " " # "World";

// 2.5.5
// Logical Operator
// and , or, not
let isLong = not true;

// 2.5.6
// Bitwise Operator

// 2.5.7
// Operator Presedence
let res : Nat =  1+ 2 +3 * 4 / 5;




// 2.6
// Pattern Matching

let individual = ("Male" , 24);
let (gender,numb) = individual;

let person = {
    name = "Jayesh";
    age = 19;
};
let {name = firstName ; age = Umar} = person;


// 2.7
// Functions
func myFunc() {};

func add(x : Nat) {};
func addReturn(a : Nat , b :Nat) : Nat {a+b};

// Function Type
type Add = (Nat) -> ();
let ourFnc : Add = add;
ourFnc(5);



// 2.8
// Options and Results
let a : ?Nat = ?25;
let bc : ?Text = ?"Bye";

// Option values can have the null value of type Null
let qe : ?Nat = null : Null;

func textReturn() : ?Text {
    ?"GoodBye";
};
func returnDiff(x : Nat , y : Nat) : ?Nat {
    // ?(x-y);
    null;
};


type Result = {
    #ok;
    #error;
};

func check() : Result {
    #ok;
};




// 2.9
// Control Flow
// 2.9.1
// If-expression

let condition = true;
var x2 = 54;
if(condition) x2:=74;

if(condition) {}
else {};

if(condition) x2 := 1
else x2 := 74;

// Through this code, Text gets stored in variable result acc to the conditon matched
let result : Text = if (condition) {
    "condition was true";
} else {
    "condition was false";
};



// 2.9.3
// Switch
// Make the case for each condition
switch(condition) {
    case(true) {};
    case(false) {};
};

//example
type Color = {
    #Black;
    #Blue;
    #Red;
    #Brown;
};
let color2 : Color = #Brown;
var cV = 0;
switch(color2) {
    case(#Blue) {
        cV := 1;
    };
    case(#Black) {
        cV += 10;
    };
    case(#Red) {
        cV := 2;
    };
    case(#Brown) {
        cV := 3;
    };
};




