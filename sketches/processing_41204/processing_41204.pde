
/*Joseph Kotay.  Practice Computational Methods. Professor Nick Senseke. Lecture 7. Random Path Demo. Dominoes
 This sketch attempts to simulate a scattered dominoe effect for the first couple frames, and then goes back to the toggle style of drawing
 duplicate dominoes*/

////////////// Dominoe Simulation //////////////////

int num = int(random(10,40)); // gives a changing number of dominoes between mouse clicks
float dominoeSize = random(20,40); // The size of the dominoes also change between mouse clicks.

Dominoe[] myDominoe = new Dominoe[num]; // array of dominoes
color[] dominoeColor = new color[4]; // arrayof colors

void setup() {
  size(400, 400);
  background(255);
  frameRate(10);
  smooth();

  //assign colors to the array matrix.
  dominoeColor[0] = color(40, 80);
  dominoeColor[1] = color(30, 70, 20, 90);
  dominoeColor[2] = color(255, 80);
  dominoeColor[3] = color(165, 70, 15, 80);

  //seed array
  for (int d=0; d<myDominoe.length; d++) {
    myDominoe[d] = new Dominoe();
  }
}

void draw() { 
  for (int d=0; d<myDominoe.length; d++) {
    myDominoe[d].update();
    myDominoe[d].display();
  }
}

//establish a class for Dominoes
class Dominoe {
  int x = int(random(width));
  int y = int(random(height));
  color col = dominoeColor [int(random(0, 3))];

  Dominoe() {
  }

  void update() { //this regulates the path of the dominoes after they are scattered.
    x = x + int(random(-10, 10));
    y = y + int(random(-10, 10));
  }

  void display() {

    strokeWeight(3);
    stroke(255,70);
    fill(col);
    pushMatrix();
    translate(x,y);
    rotate(frameCount * radians(2000));  // roate and scatter the dominoes before scattered them.
    rect(x, y, dominoeSize, (2 * dominoeSize));  // the width and height of the dominoes have a 1:2 relationship, no matter what size they are.
    popMatrix();

// lear the screen and start over.
    if (mousePressed) {
      background(255);
    } 
    else {
      loop();
    }
  }
}


