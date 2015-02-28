
class being {

  // represents a single cell, which is a member of a species.
  
  float ag; // speed at which species spreads into neighbouring cells 0-1.0
  int type;
  
  public being(int _type,float _ag) {
    type=_type;
    ag=_ag;
  }
  
  public void debug() {
    print ("Species=("+type+")\n");
  }
}

