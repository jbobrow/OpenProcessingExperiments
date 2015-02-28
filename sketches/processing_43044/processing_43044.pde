
//Zena Koo
//Intro to Computational Media
//Week 5 assignment: object oriented programming
//ITP NYU


Comet myComet1;
Comet myComet2; 
Comet myComet3; // three objects!

void setup() {
  size(600, 600);
  myComet1 = new Comet(color(#FFD603), 0, 100, 3, 6); // Parameters and different shades of yellow
  myComet2 = new Comet(color(#FFF703), 0, 10, 2, 4);
  myComet3 = new Comet(color(#FCFF58), 0, 5, 1, 2);
  smooth();
}

void draw() {
  background(#0D2A50); //midnight blue background color
  myComet1.move();
  myComet1.display();
  myComet2.move();
  myComet2.display();
  myComet3.move();
  myComet3.display();
}

class Comet { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos ;
  float ypos ;
  float xspeed;
 float yspeed;

  Comet(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 75, 75);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    else {
      ypos=random(0,height);
    }
  }
}


