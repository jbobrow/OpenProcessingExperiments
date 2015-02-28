
//the class for the main object - the tank
class Tank {

  //fields
  // the object's x-coordinate
  int x;
  // the object's y-coordinate
  int y;
  // the size of the object
  int a, b;
  // the speed of the tank
  float speed = 1;

  //Constructor
  Tank (int xTemp, int yTemp) {
    x = xTemp;
    y = yTemp;
    a = 160;
    b = 60;
  }

  //methods
  void display() {
    fill(80, 180, 16);
    stroke(0);
    strokeWeight(4);
    rectMode(CENTER);
    rect(x - 60, y - 40, a/2, b/10);
    fill(2, 113, 8);
    ellipse(x + 13, y - 58, a/4, b/4);
    ellipse(x, y, a, b);
    strokeWeight(5);
    ellipse(x, y + 15, a, b/1.2);
    strokeWeight(4);
    ellipse(x - 30, y - 40, a/10, b/10);
    ellipse(x + 10, y - 40, a/2, b/2);
    //draw wheels by calling the function
    wheel(x, y + 15, 40);
    wheel(x - 36, y + 15, 28);
    wheel(x + 36, y + 15, 28);
    wheel(x - 62, y + 15, 16);
    wheel(x + 62, y + 15, 16);
  }

//animate the tank
  void move() {  
    x -= speed;
    //stop the tank when it approaches the house
    if (x < 300) {
      x = 300;
    }
  }
}


