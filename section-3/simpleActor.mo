import Text "mo:base/Text";
actor {
    private var comment = "";

    public shared query func readComment() : async Text {
        comment;
    };
    
    public shared func writeComment(_comment : Text) : async () {
        comment := _comment;  
    };

    public shared func deleteComment() {
        comment := "";
    }
}