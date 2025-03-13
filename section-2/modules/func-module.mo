import Nat "mo:base/Nat";
module {
    public func add(x:Nat, y:Nat) : Nat {
            x + y
    };

    private func diff(x:Nat, y:Nat) : Nat {
        x - y;
    };

    public let sub = diff;
};