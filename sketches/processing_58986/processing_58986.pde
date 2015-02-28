
  //////////////////////////////////////////////////////////////////////////////////////
 // CLASS: AGENT.....................................................................//
//////////////////////////////////////////////////////////////////////////////////////

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
  //Add some noise by using a controlled randomness
  float noiseScale = 0.3;
  // The age integer
  int FAge;


    /////////////////////////
   ////// CONSTRUCTOR //////
  /////////////////////////
  Flocker(
  // Position
  PVector _Floc, 
  // Velocity
  PVector _Fvel,
  //Age
  int _FAge
  ) 
  {
    // Push variables to local
    Floc = _Floc;
    Fvel = _Fvel;
    FAge = _FAge;
  }

     ///////////////////////////////////////////////////////////////
    ////// FUNCTIONS //////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////
  ////// Run calls what the flocker will do /////////////////////
 ///////////////////////////////////////////////////////////////
  void run() {
    flockIt(); // Move the object with local awarenes
    updatePos(); // Keep the Flocker on the working area
    display(); // Draw the Flocker
    Age(); // Make the Flocker 1 step older in each round
  }

  ///////////////////////////////////////////////////////////////////
 // Age ////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
  void Age() {
  FAge++; //Just add 1 to the age parameter each time it runs
  }

   ///////////////////////////////////////////////////////////////
  ////// Flock //////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////
 
void flockIt() {

    for (int j = 0; j < FlockerPop.size(); j++) {
      Flocker F = (Flocker) FlockerPop.get(j);

      float FlockerDist = PVector.dist(Floc, F.Floc);

      if (FlockerDist > 0) {
        if (FlockerDist < minDist) {

          if (FlockerDist < align*multiplier) {
            PVector addVec = F.Fvel.get();
            addVec.mult(FlockerDist);
            Facc.add(addVec);
            Facc.normalize();
          }

          if (FlockerDist < avoid*multiplier) {
            if (random(1) > 0.2) {
            PVector addVec = F.Floc.get();
            addVec.mult(2);
            addVec.sub(Floc);
            addVec.mult(FlockerDist);
            Facc.sub(addVec);
            Facc.normalize();}
            else{
              PVector addVec = F.Floc.get();
            addVec.mult(2);
            addVec.add(Floc);
            addVec.mult(FlockerDist);
            Facc.sub(addVec);
            Facc.normalize();}
          }

          if (FlockerDist < cohesion*multiplier) {
            PVector addVec = F.Floc.get();
            addVec.add(Floc);
            addVec.mult(FlockerDist);
            Facc.add(addVec);
            Facc.normalize();
          }
        }
      }
    }
  }


    ///////////////////////////////////////////////////////////////
   ////// This function will update the flocker's position ///////
  ///////////////////////////////////////////////////////////////
  
  void updatePos() {
    
    //Produce the steering behaviour, responsable for the dampened changes
    Fvel.add(Facc);
    
    //Add some noise to the vector components
    Fvel.x = random(1-noiseScale, 1+noiseScale)*(Fvel.x);
    Fvel.y = random(1-noiseScale, 1+noiseScale)*(Fvel.y);
    Fvel.z = random(1-noiseScale, 1+noiseScale)*(Fvel.z);

    //Limit the speed with graphic purposes
    Fvel.limit(5);
    Floc.add(Fvel);
    
    //if the X coord is out of the boundary, move it to the other boundary
    if (Floc.x > width*2) { 
      Floc.x = 0;
    } 
    if (Floc.x < 0) {
      Floc.x = width*2;
    }
    
    //if the Y coord is out of the boundary, move it to the other boundary
    if (Floc.y > height*2) { 
      Floc.y = 0;
    } 
    if (Floc.y < 0) {
      Floc.y = height*2;
    }
    
    //if the Z coord is out of the boundary, move it to the other boundary
    if (Floc.z > depth*2) { 
      Floc.z = 0;
    } 
    if (Floc.z < 0) {
      Floc.z = depth*2;
    }
    lenght = Fvel;
  }

  //////////////////////////////////////////////////////////////
 ////// Display renders the shape to the Flocker //////////////
//////////////////////////////////////////////////////////////

  void display() {
    //Use the current position to map zones by colours and the age to transparency
    stroke((map(Floc.x, 0, width, 0, 200)), (map(Floc.y, 0, width, 0, 200)), (map(Floc.z, 0, width, 0, 200)), 255-(map(FAge,0,MaxAge, 0,255)));
    strokeWeight(5);
    point(Floc.x, Floc.y, Floc.z);
    strokeWeight(1.5);
    PVector end = new PVector(Floc.x, Floc.y, Floc.z);
    lenght.mult(7);
    end.sub(lenght);
    //Draw a line which represents the direction of the Flocker
    line(Floc.x, Floc.y, Floc.z, end.x, end.y, end.z);
  }
}


