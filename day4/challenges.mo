import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
actor {
  type List<T> = List.List<T>;
    // Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
    func unique<T>(l : List<T>, equal: (T,?T) -> Bool) : List<?T> {
      var normalized : List<?T> = null;
      var headlessList : List<T> = l;
      while(List.isNil(headlessList) == false){
        let (poppedElement, resList) = List.pop<T>(l);
        headlessList := resList;
        if (List.find<T>(headlessList, func (e){equal(e, poppedElement)}) == false){
          normalized := List.push(poppedElement, normalized);
        };
      };
      normalized;
    };

    // Write a function reverse that takes l of type List and returns the reversed list.
    func reverse<T> (l : List<T>) : List<T>{
      List.reverse(l); //hope it is not considering cheating
    };

    // Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    public shared ({caller}) func is_anynomous() : async Bool {
        Principal.isAnonymous(caller);
    };

    // Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".
    func find_in_buffer<T> (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) : ?Nat{
        Buffer.indexOf<T>(val, buf, equal);
    };

    // Take a look at the code we've seen before in this guide and add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.

    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
        usernames.put(caller, name);
    };

    public func get_usernames() : async [(Principal, Text)]{
        Iter.toArray(usernames.entries());
    };
    
}