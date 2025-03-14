// 3.1
//Actor
// Actors, like objects, are like a package of state and a public API that accesses and modifies that state. Unlike objects, actors may only have private (immutable or mutable) variables

actor {

    // Function in actors
    // 1. Public shared query functions
    public shared query func read() : async () {
        ();
    };

    //2. Public shared update function
    public shared func write() : async () {
        ();
    };

    // 3. Public shared oneway function
    public shared func oneway() {
        ();
    };
};


// 3.1.1
// From actor to cannister
//? A canister is like a home for an actor. It lives on the Internet Computer Blockchain
// Each canister can host one actor
