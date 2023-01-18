import Array "mo:base/Array";
import Int "mo:base/Int";

module{
    // In your file called utils.mo: create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
    public func second_maximum(array : [Int]) : async Int{
      var myArray :[Int] = Array.sort(array, Int.compare);
        return myArray[myArray.size()-2];
    };

    //In your file called utils.mo: create a function called remove_even that takes an array [Nat] and returns a new array with only the odd numbers from the original array. 
    public func remove_even(array : [Nat]) : async [Nat]{
        let isOdd = func (x : Nat) : Bool { x % 2 == 1 };
        return Array.filter(array, isOdd);

    };
    
    //In your file called utils.mo: write a function drop that takes 2 parameters: an array [T] and a Nat n. This function will drop the n first elements of the array and returns the remainder.
    public func drop<T>(xs : [T], n : Nat) : [T] {
      var index : Nat = 0;
      let isOverThreshold= func (x : T) : Bool { 
          if (index >= n) {
              return true;
          } 
          else {
              index += 1; 
              return false;
          }        
      };
      return(Array.filter<T>(xs,isOverThreshold));
      
    };

}

