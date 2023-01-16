Q: How much is the current memory capacity of a canister?
A: The current max size is 4GB

Q:What is the issue with the following code sample?
    actor {
        let counter : Nat = 0;
        public func increment_counter() : async () {
        counter := counter + 1;
        };
    }
A: The issue is in the "let" keyword, since counter is supposed to be a variable and not immutable. "let" should be replaced with "var"

Q: What is the issue with the following code sample?
    actor {
        var message : Text = 0;

        public query func change_message(new_message : Text) : async () {
            message := new_message;
            return;
        };

        public query func see_message() : async Text {
            return(message);
        };
    }

A: The issues here are two: 
    1) The first assignement to the "message" variable is wrong: Motoko is a strongly typed language, so it cannot be possible to assign a number to a Text variable. 0 should be replaced with "0".
    2) "change_message" function is declared as query but it also change wants to change the state. "query" keyword should be removed from declaration of this func.

Q: False or True: we can remove the keyword **async** for return argument of a query function since queries are faster to answer.
A: False. Queries are faster but I would not be confident that it guarantees for all the other kind of possible latences. "async" should not been removed for that reason.
