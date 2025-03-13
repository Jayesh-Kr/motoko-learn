import Mod "modules/module-nested";
import MyModule "modules/module";
import MathModule "modules/func-module";
import Text "mo:base/Text";

let string : Text = MyModule.b;
let personName = Mod.Person.firstName;
let city = Mod.place;

let sum = MathModule.add(5,6);
let diff = MathModule.sub(6,5);


