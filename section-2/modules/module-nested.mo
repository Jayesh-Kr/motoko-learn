// Nested Module
module {
    public module Person {
        private let secretName = "Tillu Badmosh";
        public let firstName = "Jayesh";
    };
    private module Info {
        public let city : Text = "Lucknow";
    };
    public let place = Info.city;
}