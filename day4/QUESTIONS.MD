
**Q**: Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?

**A**: Not by default, but there is the possibility to preserve some kind of variables if they are intentionally declared with the "stable" keyword. Heap memory is 48GiB after this recent proposal https://dashboard.internetcomputer.org/proposal/92573 has been executed

**Q**: How much accounts can a unique Principal own?

**A**: A single Principal may have control over an (almost) unlimited number of Accounts.

**Q**: Can we safely upgrade a canister from interface A to interface B?
Interface A
```motoko
actor {
  public func greet(surname : Text, firstname : Text) : async Text {
    return "Hello" # firstname # surname # " !";
  };
}
```
Interface B
```motoko
actor {
  public func greet(firstname : Text) : async Text {
    return "Hello" # firstname # " !";
  };
}

**A**: I think no, because the func changed its interface declaration and now appears to be a different one since in Interface B accepts only one input instead of two as interface A does.