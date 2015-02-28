
class Square {

  // Variables
  color c; 
  float xpos;
  float ypos;
  float dim = 20;

  // Constructor
  Square(color anyC, float anyXpos, float anyYpos, float anyDim) {
    c = anyC;
    xpos = anyXpos;
    ypos = anyYpos;
    dim = anyDim;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    noStroke();
    rect(xpos, ypos, dim, dim);
  }
}


