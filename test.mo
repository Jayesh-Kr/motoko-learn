import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Time "mo:base/Time";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Text "mo:base/Text";

actor {
    type UserId = Principal;

    type User = {
        username: Text;
        role: Text;
    };

    type Task = {
        id: Nat;
        title: Text;
        description: Text;
        status: Text;
        assignee: ?UserId;
        created: Time.Time;
        updated: Time.Time;
    };

    type Error = {
        #UserNotFound;
        #TaskNotFound;
        #NotAuthorized;
    };

    // Custom hash function for Nat
    private func natHash(n : Nat) : Hash.Hash {
        Text.hash(Nat.toText(n))
    };

    private stable var usersEntries : [(UserId, User)] = [];
    private var users = HashMap.HashMap<UserId, User>(10, Principal.equal, Principal.hash);

    private stable var tasksEntries : [(Nat, Task)] = [];
    private var tasks = HashMap.HashMap<Nat, Task>(10, Nat.equal, natHash);
    private stable var nextTaskId : Nat = 0;

    system func preupgrade() {
        usersEntries := Iter.toArray(users.entries());
        tasksEntries := Iter.toArray(tasks.entries());
    };

    system func postupgrade() {
        users := HashMap.fromIter<UserId, User>(usersEntries.vals(), 10, Principal.equal, Principal.hash);
        tasks := HashMap.fromIter<Nat, Task>(tasksEntries.vals(), 10, Nat.equal, natHash);
        usersEntries := [];
        tasksEntries := [];
    };

    public shared(msg) func registerUser(username: Text, role: Text) : async Result.Result<(), Error> {
        let userId = msg.caller;
        
        switch (users.get(userId)) {
            case (?_) { #ok(()) }; // User already exists, treat as login
            case null {
                let newUser : User = {
                    username = username;
                    role = role;
                };
                users.put(userId, newUser);
                #ok(())
            };
        }
    };

    public shared(msg) func getProfile() : async Result.Result<User, Error> {
        let userId = msg.caller;
        
        switch (users.get(userId)) {
            case (?user) { #ok(user) };
            case null { #err(#UserNotFound) };
        }
    };

    public shared(msg) func createTask(title: Text, description: Text) : async Result.Result<Nat, Error> {
        let userId = msg.caller;
        
        switch (users.get(userId)) {
            case (?user) {
                if (user.role != "council") {
                    return #err(#NotAuthorized);
                };
                let taskId = nextTaskId;
                nextTaskId += 1;
                
                let newTask : Task = {
                    id = taskId;
                    title = title;
                    description = description;
                    status = "open";
                    assignee = null;
                    created = Time.now();
                    updated = Time.now();
                };
                
                tasks.put(taskId, newTask);
                #ok(taskId)
            };
            case null { #err(#UserNotFound) };
        }
    };

    public shared(msg) func assignTask(taskId: Nat) : async Result.Result<(), Error> {
        let userId = msg.caller;
        
        switch (users.get(userId)) {
            case (?user) {
                if (user.role != "contractor") {
                    return #err(#NotAuthorized);
                };
                switch (tasks.get(taskId)) {
                    case (?task) {
                        let updatedTask : Task = {
                            id = task.id;
                            title = task.title;
                            description = task.description;
                            status = "assigned";
                            assignee = ?userId;
                            created = task.created;
                            updated = Time.now();
                        };
                        tasks.put(taskId, updatedTask);
                        #ok(())
                    };
                    case null { #err(#TaskNotFound) };
                }
            };
            case null { #err(#UserNotFound) };
        }
    };

    public query func getAllTasks() : async [Task] {
        Iter.toArray(tasks.vals())
    };
}