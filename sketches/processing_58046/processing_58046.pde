
///////////////////////////////////////////////////////////////////////////////////////
// CLASS: AGENT.....................................................................//
/////////////////////////////////////////////////////////////////////////////////////

class Agent {
  //GLOBAL VARIABLES
  PVector Aloc, Ploc5, Ploc4, Ploc3, Ploc2, Ploc1; // To store position, actual and 5 previous
  PVector Avel = new PVector(random(maxVel), random(maxVel), random(maxVel)); //To store velocity
  float Asize; // To store the mass of the object



  //CONSTRUCTOR
  Agent(
  // Position
  PVector _Aloc, 
  // Velocity
  PVector _Avel, 
  // Size
  float _Asize) {
    //Push variables to local
    Aloc = _Aloc;
    Avel = _Avel;
    Asize = _Asize;
  }


  //FUNCTIONS
  void run() {
    //What the agent will do
    moveIt(); // Will move the object according to the velocity defined with other functions. Randomly for the time being
    returnIt(); // Will keep the agent on the working box
    display(); // Renders the image of the agent
  }

  void moveIt() { //This changes the position for the object, storing the 5 preceeding
    Aloc = PVector.add(Aloc, PVector.div(Avel, Asize)); //fatter move slower
  }

  void returnIt() {
    if (Aloc.x > width) { //if the X coord is out of the boundary, move it to the other boundary
      Aloc.x = 0;
    } 
    else if (Aloc.x < 0) {
      Aloc.x = width;
    }

    if (Aloc.y > height) { //if the Y coord is out of the boundary, move it to the other boundary
      Aloc.y = 0;
    } 
    else if (Aloc.y < 0) {
      Aloc.y = height;
    }

    if (Aloc.z > depth) { //if the Z coord is out of the boundary, move it to the other boundary
      Aloc.z = 0;
    } 
    else if (Aloc.z < 0) {
      Aloc.z = depth;
    }
  }


  void display() {
    noFill();
    //    stroke(255, 255, 255, (255/AsizeMax*Asize));
    //    strokeWeight (Asize);
    //    point (Aloc.x, Aloc.y, Aloc.z);
    stroke(255, 255, 255);
    ellipse (Aloc.x, Aloc.y, Asize, Asize);
  }
}


