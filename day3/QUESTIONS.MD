**Q**: True or False: the Internet Computer has a unique public key that can be used to verify responses coming from any subnets.

**A**: true

**Q**: True or False: when I realize an update call, the boundary node will participate in the consensus but not during query calls.

**A**: false

**Q**: True or False: I can create a certified variable that will certify the response of the following actor:
```motoko
actor {
 public func hello(name : Text) : async Text {
 return ("hello # name");
 };
}
```
**A**: false

