
class Drops {

  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  int circleA = 5;
  int circleB = 10;
  int circleC = 25;


  //CONSTRUCTOR
  Drops(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //FUNCTIONS

  //----run
  void run() {
    display();
    grow();
    remove();
  }
  //-------------display  
  void display() {
    ellipseMode(CENTER);
    stroke(125);
    fill(0, 10);
    rect(0, 0, width, height);
    fill(5, 5, 255, 50);
    ellipse(x, y, circleA, circleA);
    ellipse(x, y, circleB, circleB); 
    ellipse(x, y, circleC, circleC);
  }

  //-------------grow  
  void grow() {
    circleA ++;
    circleB ++;
    circleC ++;
  }

  //-------------remove 

  void remove() {
    if (circleA >75) {
      circleA=0;
    }

    if (circleB > 100) {
      circleB=0;
    }

    if (circleC > 125) {
      circleC=0;
    }
  }
}


