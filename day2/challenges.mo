import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Array "mo:base/Array";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";
import Int "mo:base/Int";

actor {
  // Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
  public func average_array(array : [Int]) : async Int {
    var sum : Int = 0;
    for (number in Array.vals(array)) {
      sum += number;
    };
    return sum / array.size();
  };

  // Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
  public func count_character(t : Text, c : Char) : async Nat {
    var sum : Nat = 0;
    for (letter in t.chars()) {
      if (letter == c) {
        sum += 1;
      };
    };
    return sum;
  };

  // Write a function factorial that takes a natural number n and returns the factorial of n.
  public func factorial(n : Nat) : async Nat {
    if (n > 1) {
      return (await factorial(n - 1)) * n;
    } 
    else {
      return 1;
    };
  };

  //Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
  public func number_of_words(t : Text) : async Nat {
    //This code is assuming that a word is everything separated by a space.
    //It should be integrated considering the punctuation and symbols probably using a range
    var sum : Nat = 0;

    //valid is used to skip multiple spaces in a raw
    var valid : Bool = true;
    for (letter in t.chars()) {
      if (letter == ' ') {
        if ( valid == true){
          sum += 1;
          valid := false;
        };
      }
      else{
          valid := true;
        }
    };
    return sum + 1;
  };

  //Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
  public func find_duplicates(a : [Nat]) : async [?Nat]{
    var counter : Nat = 0;
    let myMap = Map.HashMap<Nat,Bool>(0,Nat.equal,Hash.hash);
    var output : [var ?Nat] = Array.init<?Nat>(a.size(), null);
    for (number in Array.vals(a)) {
      if (myMap.get(number) == null){
        myMap.put(number,true);
      }
      else
      if (myMap.get(number) == ?true){
        myMap.put(number,false);
        output[counter] := ?number;
        counter += 1;
      }
    };
    let isValid = func (x : ?Nat) : Bool { x != null };
    return Array.filter(Array.freeze(output), isValid);
  };

  // Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
  public func convert_to_binary(n : Nat) : async Text{
    var divided : Nat = n;
    var remainders : Text = "";
    while (divided > 0){
      remainders := Nat.toText(divided % 2) # remainders;
      divided := divided / 2;
    };
    return remainders;
  }

};
