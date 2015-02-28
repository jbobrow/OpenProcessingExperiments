
///////////////////////////////////////////////////////////////
// AGENT /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

class Agent {
  //GLOBAL VARIABLES
  PVector Aloc;
  PVector Avel;
  float Asize;
  


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
    display(); // Renders the image of the agent
  }

  void display() {
    noFill();
    stroke(255, 255, 255);
    ellipse (Aloc.x, Aloc.y, Asize, Asize);
    //sphere (Asize);
  }
}


