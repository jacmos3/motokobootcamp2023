**Q**: Who controls the ledger canister?

**A**: The Network Nervous System DAO (NNS).

**Q**: What is the subnet of the canister with the id: **mwrha-maaaa-aaaab-qabqq-cai**? How much nodes are running this subnet?  

**A**: according to the dashboard: https://dashboard.internetcomputer.org/subnet/pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe the subnet is pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe and the nodes are 16

**Q**: I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?

**A**: Voting Powah for the input data is 16.2, according to the code I wrote based on the information taken here: https://internetcomputer.org/docs/current/tokenomics/nns/nns-staking-voting-rewards#voting-rewards . Follows the code I've done on playground to do it:

```motoko
actor {
  
  public func votingPowah(icp : Float, ddYears : Float, lYears: Float) : async Float{
    //Getting the averages: 51 months having 1.53 voting powah.
    //Note: I can hardcode 51 and 1.53, but I left the operations just to let them clear
    let averageDdMonths : Float = ((8 * 12) + 6)/2;
    let averageDdVP : Float = (1.06 + 2)/2;

    //Calculating the Voting Powah of the input based on the Dissolve Delay period
    let ddVP : Float = (averageDdVP * (ddYears * 12))/averageDdMonths;
    
    //Getting the averages: 24 months having 1.125 Voting powah.
    let averageLMonths : Float = ((4 * 12) + 0 * 12) / 2;
    let averageLVP : Float = (1.25 + 1) / 2;

    //Calculating the Voting Powah of the input based on the Locked period
    let lVP : Float = (averageLVP * (lYears * 12)) / averageLMonths;

    return icp * ddVP * lVP;
  }
}
```

**Q**: What is wrong with the following code?
```motoko
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
 
}
```

**A**: the error is that "Nat" module has not been imported, and plus "n" and "t" are unused and could be removed.

**Q**: What is wrong with the following code?
```
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
 
}
```
**A**: should remove the "var" keyword in [var Text] both on variable declaration and function output. Plus func input is unused and could be removed

**Q**: What is wrong with the following code?
```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
 
}
```

**A**: it should be imported the Array module. Then the Array.append is deprecated, it should be used a Buffer. Plus "languages" and return is a waste of code. Full code:
```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    Array.append<Text>(languages, [new_language]);
  };
 
}
```