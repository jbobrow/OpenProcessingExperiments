
//  R.A. Robertson 2009.02 "Gravity" ~ www.rariora.org ~
// Inspired by yugop.com LineX50
// http://yugop.com/ver3/index.asp?id=16

int numChase = 50; // Subtract 1 for actual number, since i = 1 (no count zero)
int flag;
float base = 0.04; // Sets minimum velocity in stiffness equation
float stiff = 0.0008; // Affects the spread of the ribbon
float damp = 0.95;
boolean toggleLoop = true;

Chaser [] chasers = new Chaser[numChase]; // Declare the objects via the array
    
void setup() {
  size(900, 400);
  background(0);
  frameRate(20);
  flag = 0;

  for (int i=1; i < numChase; i++) {  // Construct the objects (stiff, damp)

      chasers[i] = new Chaser (base + i*stiff, damp); // Bill Morgain solution 
  }
}

void draw() {
  fill(0, 1.0);
  noStroke();
  rect(0, 0, width, height);

  if (flag == 1) { // Prevent anything from happening until mouse move (see below)

    for (int i=1; i < numChase; i++) {
      chasers[i].move();
      chasers[i].display();
    }
  }
}

void mouseMoved() { 
  flag = 1; // Sets flag as true when mouse moves, so methods will run.
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop();
      cursor();
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
}

/* ========== Chaser Class =========== */

class Chaser {
  float stiffness;
  float damping;
  float velocityX;
  float velocityY;
  float x, oldX;
  float y, oldY;

  // Constructor
  Chaser(float stiff, float damp) {
    stiffness = stiff;
    damping = damp;
    oldX = x = random(width*.3, width*.7);
    oldY = y = random(height*.3, height*.7);

  }

  void move() {
    float forceX = stiffness * (mouseX - x);
    float forceY = stiffness * (mouseY - y);
    velocityY = damping * (velocityY + forceY);
    velocityX = damping * (velocityX + forceX);
    y = y + velocityY;
    x = x + velocityX;

  }

  void display() {
    smooth();
    stroke(150, 50, 0, 200);
    line(x, y, oldX, oldY);
    oldX = x;
    oldY = y;
  }
}
