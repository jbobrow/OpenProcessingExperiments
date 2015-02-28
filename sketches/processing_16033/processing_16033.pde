


class ForceField {
  ArrayList Forces;    // An arraylist for all the Forces
  static final float Mag=0.03; // maximum Magnitude  for a force
  
  ForceField(int Spacing) {
    Forces = new ArrayList();              // Initialize the arraylist
    for (int x=10; x<width; x+=Spacing) {
      for(int y=26; y<height; y+=Spacing) {
        Forces.add(new ForcePoint(
          new PVector(x,y),      // The Position 
          new PVector(random(-Mag,Mag),random(-Mag,Mag))    // The Force
          )
        );    // Add a ForcePoint at this point to the arraylist
      }
    }
  }

  PVector GetLocalForce(PVector Place) {
    PVector LocalForce = new PVector(0,0);
    for (int i=0; i<Forces.size(); ++i) {
      ForcePoint p = (ForcePoint) Forces.get(i);
      PVector PointForce = new PVector(p.Force.x, p.Force.y);
      float Distance = PVector.dist(Place, p.loc);
      PointForce.div(Distance/5); // it decreases like gravity
      PointForce.limit(1);
      LocalForce.add(PointForce);
    }
    //LocalForce.div(Forces.size());  // So it is an average, not a sum
    return LocalForce;
  }
  
  PVector GetNearestForce(PVector Place) {
    float ClosestDistance = 1000000000;  //Impossiby high
    PVector ClosestForce = new PVector(0,0);
    for (int i=0; i<Forces.size(); ++i) {
      ForcePoint p = (ForcePoint) Forces.get(i);
      float Distance = PVector.dist(Place, p.loc);
      if (Distance < ClosestDistance) {
        ClosestDistance = Distance;
        ClosestForce = p.Force;
      }
    }
    return ClosestForce;
  }
  
  void SetNearestForce(PVector Place, PVector Force) {
    float ClosestDistance = 1000000000;  //Impossiby high
    int ClosestForcePoint = 0;
    for (int i=0; i<Forces.size(); ++i) {
      ForcePoint p = (ForcePoint) Forces.get(i);
      float Distance = PVector.dist(Place, p.loc);
      if (Distance < ClosestDistance) {
        ClosestDistance = Distance;
        ClosestForcePoint = i;
      }
    }
    ForcePoint p = (ForcePoint) Forces.get(ClosestForcePoint);
    p.Force = Force;
  }

  void run() {
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = Forces.size()-1; i >= 0; i--) {
      ForcePoint p = (ForcePoint) Forces.get(i);
      p.run();
      if (p.dead()) {
        Forces.remove(i);
      }
    }
  }

  
  void addForcePoint(PVector Location, PVector Force) {
    Forces.add(new ForcePoint(Location, Force));
  }

  void addForcePoint(ForcePoint p) {
    Forces.add(p);
  }

  // A method to test if the ForcePoint system still has Forces
  boolean dead() {
    if (Forces.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}

