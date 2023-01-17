import Float "mo:base/Float"
actor Tasks {

  //Gets in input two Integer numbers and returns the multiplication
  public func multiply(n : Int, m : Int) : async Float {
    return Float.fromInt(n * m);
  };

  public func task (n: Int, m : Int) : async Float {
    var res : Float = 10.3 + (await multiply(n,m));
    
    //if the res value is positive I can return the sqrt value
    if (res > 0){
      return  Float.sqrt(res)
    }
    else // cannot sqrt_ing a negative number. 
      //TODO: raise error
      return 0;
  }

};

