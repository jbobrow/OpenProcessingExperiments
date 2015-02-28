
///////////////////////////////////////////////////////////////////////////////////////
// CLASS: Agent.....................................................................//
/////////////////////////////////////////////////////////////////////////////////////

class Agent {
  //GLOBAL VARIABLES
  PVector Aloc, Ploc5, Ploc4, Ploc3, Ploc2, Ploc1; // To store position, actual and 5 previous
  PVector Avel = new PVector(random(-maxVel, maxVel), random(-maxVel, maxVel), random(-maxVel, maxVel)); //To store velocity
  float Asize; // To store the mass of the object
  int AAge;



  //CONSTRUCTOR
  Agent(
  // Position
  PVector _Aloc, 
  // Velocity
  PVector _Avel, 
  // Size
  float _Asize,
  // Age
  int _AAge)  {
    //Push variables to local
    Aloc = _Aloc;
    Avel = _Avel;
    Asize = _Asize;
    AAge = _AAge;
  }


  //FUNCTIONS
  void run() {
    //What the Agent will do
    moveIt(); // Will move the object according to the velocity defined with other functions. Randomly for the time being
    returnIt(); // Will keep the Agent on the working box
    display(); // Renders the image of the Agent
    Age();
  }
  
  void Age() {
  AAge++;
  }

  void moveIt() { //This changes the position for the object, storing the 5 preceeding
    Aloc = PVector.add(Aloc, PVector.div(Avel, Asize)); //fatter move slower
  }

  void returnIt() {
    if (Aloc.x > width*2) { //if the X coord is out of the boundary, move it to the other boundary
      Aloc.x = 0;
    } 
    else if (Aloc.x < 0) {
      Aloc.x = width*2;
    }

    if (Aloc.y > height*2) { //if the Y coord is out of the boundary, move it to the other boundary
      Aloc.y = 0;
    } 
    else if (Aloc.y < 0) {
      Aloc.y = height*2;
    }

    if (Aloc.z > depth*2) { //if the Z coord is out of the boundary, move it to the other boundary
      Aloc.z = 0;
    } 
    else if (Aloc.z < 0) {
      Aloc.z = depth*2;
    }
  }


  void display() {
    noFill();
    stroke((map(Aloc.x, 0, width, 0, 200)), (map(Aloc.y, 0, height, 0, 200)), (map(Aloc.z, 0, depth, 0, 200)), 255-(map(Age,0,MaxAge, 50,255)));
    strokeWeight (Asize);
    point (Aloc.x, Aloc.y, Aloc.z);
  }
}


