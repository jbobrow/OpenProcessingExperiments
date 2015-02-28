
/*
Assignment 5
Meron Kasahun
mkasahun@brynmawr.edu
CS-110 1
November 12, 2012
*/

class MKasahunObj extends AnimatedObject {
  float x;
  float y;

  /** Constructor */
  MKasahunObj(float size) {
//variables
    x = random(0, 800);
    y = random(0, 600);
  }
// display object
  void display() {
    pushMatrix();
    scale (1.2);
    noStroke();
    fill(139, 63, 216, 200);
    arc(x, y, 50, 60, PI, 2*PI);
    arc(x-8, y, 5, 50, 0, PI);
    arc(x+16, y, 5, 50, 0, PI);
    arc(x+12, y, 5, 50, 0, PI);
    arc(x+8, y, 5, 50, 0, PI);
    arc(x-16, y, 5, 50, 0, PI);
    arc(x-12, y, 5, 50, 0, PI);
    arc(x-4, y, 5, 50, 0, PI);
    arc(x+4, y, 5, 50, 0, PI);
    arc(x, y, 5, 50, 0, PI);
    ellipseMode(CENTER);
    fill (255, 255);
    ellipse(x-5, y-8, 8, 10);
    ellipse(x+5, y-8, 8, 10);
    fill(0, 255);
    ellipse(x+5, y-8, 4, 5);
    ellipse(x-5, y-8, 4, 5);
    popMatrix();
  }
//move
  void move(PVector[] allObjectsLocations) { 
    x = x+1;
    y = y+sin(.08*x);
    if (x > width) {
      x = x/-100;
    }
    else {
      x = x;
    }
    //reaction to other objects
    /*if (allObjectsLocations[i].x == x && allObjectsLocations[i].y == y) {
      ellipseMode(CENTER);
      fill(69, 181, 214, 200);
      ellipse(x, y+5, 20, 20);
      ellipse(x+20, y+5, 20, 20);
      ellipse(x-20, y-5, 20, 20);
      x = x;
      y = y-1;
    }*/
  }

  int getX () {
    return (int) x;
  }

  int getY() {
    return (int) y;
  }




  /** If you want to enhance the tank background
   * to showcase your own project, you can put
   * drawing code in this function, which is called
   * near the start of the draw() function below.
   */
  void drawTankBackground() {
  }
}
