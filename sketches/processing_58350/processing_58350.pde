
//////////////////////////////////////////////////////////////////////////////////////
// CLASS: FLOCKER..................................................................//
////////////////////////////////////////////////////////////////////////////////////

class Flocker {
  ////// GLOBAL VARIABLES //////
  // To store position
  PVector Floc;
  //To store velocity
  PVector Fvel;
  // To store the mass of the object
  float Fsize; 
  // To store the acceleration, responsable for the steering behaviour
  PVector Facc = new PVector (0, 0, 0);
  //To define the third dimension of the box
  int depth = height;



  ////// CONSTRUCTOR //////
  Flocker(
  // Position
  PVector _Floc, 
  // Velocity
  PVector _Fvel, 
  // Size
  float _Fsize) {
    // Push variables to local
    Floc = _Floc;
    Fvel = _Fvel;
    Fsize = _Fsize;
  }

  ///////////////////////////////////////////////////////////////
  ////// FUNCTIONS //////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////
  ////// Run calls what the flocker will do /////////////////////
  void run() {
    //What the Flocker will do
    flockIt(); // Will move the object considering everyone else
    updatePos(); // Will keep the Flocker on the working box
    display(); // Renders the image of the Flocker
  }

  ///////////////////////////////////////////////////////////////
 ////// And the meaty piece of all: Flock //////////////////////

  void flockIt() {

    for (int j = 0; j < FlockerPop.size(); j++) {
      Flocker F = (Flocker) FlockerPop.get(j);

      float FlockerDist = PVector.dist(Floc, F.Floc);

      if (FlockerDist > 0) {
        if (FlockerDist < minDist) {
          
          //Align to follow the crowd
          if (FlockerDist < align*multiplier*Fsize/30) {
            PVector addVec = F.Fvel.get();
            addVec.mult(FlockerDist);
            Facc.add(addVec);
            Facc.normalize();
          }
          
          // AVoid colisions
          if (FlockerDist < avoid*multiplier*Fsize/30) {
            PVector addVec = F.Floc.get();
            addVec.mult(2);
            addVec.sub(Floc);
            addVec.mult(FlockerDist);
            Facc.sub(addVec);
            Facc.normalize();
          }

          // Keep the crowds consistent
          if (FlockerDist < cohesion*multiplier*Fsize/30) {
            PVector addVec = F.Floc.get();
            addVec.add(Floc);
            addVec.mult(FlockerDist);
            Facc.add(addVec);
            Facc.normalize();
          }
          //}
        }
      }
    }
  }


  ///////////////////////////////////////////////////////////////
  ////// This function will update the flocker's position //////

  void updatePos() {
    //Produce the steering behaviour, responsable for the dampened changes
    Fvel.add(Facc);
    //Limit the speed with graphic purposes
    Fvel.limit(6);
    Floc.add(Fvel); //
    if (Floc.x > width*2) { //if the X coord is out of the boundary, move it to the other boundary
      Floc.x = 0;
      //Fvel.mult(-1);
    } 
    else if (Floc.x < 0) {
      Floc.x = width*2;
      //Fvel.mult(-1);
    }

    if (Floc.y > height*2) { //if the Y coord is out of the boundary, move it to the other boundary
      Floc.y = 0;
      //Fvel.mult(-1);
    } 
    else if (Floc.y < 0) {
      Floc.y = height;
      //Fvel.mult(-1);
    }

    if (Floc.z > depth*2) { //if the Z coord is out of the boundary, move it to the other boundary
      Floc.z = 0;
      //Fvel.mult(-1);
    } 
    else if (Floc.z < 0) {
      Floc.z = depth*2;
      //Fvel.mult(-1);
    }
  }

  ///////////////////////////////////////////////////////////////
  ////// Display renders the shape to the Flocker ///////////////
  void display() {
    noFill();
    stroke((map(Floc.x, 0, width, 0, 200)), (map(Floc.y, 0, width, 0, 200)), (map(Floc.z, 0, width, 0, 200)));
    strokeWeight(1);
    point(Floc.x, Floc.y, Floc.z);
  }
}


