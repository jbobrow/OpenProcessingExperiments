
//Refer to  "Demo: An array of objects" and Ballobject Code

PJ []  PJ = new PJ [100];                                      // initialize the array for PJ
color P;                                                       // color for PJ 

void setup() {
  size(300, 300);
  smooth();
  for (int i=0; i < PJ.length; i++) {   
    P = color(int(random(255)), 30, 150, random(200));           // random PJ color
    PJ [i] = new PJ (P, random(width), i*3, random(50));        // seed the PJ Array
  }
}

void draw() {
  background(255);
  for (int i=0; i < PJ.length; i++) {                            //Here 3 array
    PJ [i].move();
    PJ [i].outcome();
    PJ [i].update();
  }
}

class PJ {                                                      // class PJ : color, x_y cordinate, object speed 
  color c;
  float x;
  float y;
  float speed;

  PJ (color c_, float x_, float y_, float speed_) {             // control object here. But, if you use "random" for object position, object are lined up.   
    c = c_;
    x = x_;
    y = y_;
    speed = 1;
  }

  void outcome() {                                              //  outcome here : squares and circles
    rectMode(CENTER);
    ellipseMode (CENTER);
    noStroke();
    fill(c);
    rect(x, y, 5, 5);
    fill (0, 0, 255, 50);
    ellipse (x-random(5), y+random (5), 10, 10);                 // randome position for the center of circle : objects are moving around x-y position, which is already random.
  }

  void move() {                                                 // this idea is from Ball object code. the object hit the right side and return bakc to the left side
    x = x + speed;
    if (x > width) {
      speed = speed * - 1.0;
    }
  }
  void update() {                                              //  this makes the object return back to right side again.  
    x = x + speed;
    if (x <= 0) {
      speed = speed * -1.0;
    }
  }
}


