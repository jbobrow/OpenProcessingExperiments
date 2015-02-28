
class Spot {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the circle
  float speed; // Distance moved each frame
  int direction = 1; // Direction of motion (1 is down, -1 is up)
  // Constructor
  
  Spot(float xpos, float ypos, float dia, float sp) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
}

void move() {
  y += (speed * direction);
  if ((y > (height - diameter/2)) || (y < diameter/2)) {
    direction *= -1;
  }
}

void display() {
  noStroke();
  fill(255, 0, 100);
  ellipse(x, y, diameter, diameter);
}  
}

///////////////////////////////////////////////////////////////////////

class Ring {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the ring
  boolean on = false; // Turns the display on and off

void start(float xpos, float ypos) {
  x = xpos;
  y = ypos;
  on = true;
  diameter = 1;
}

void grow() {
  if (on == true) {
    diameter += 0.5;
    if (diameter > 400) {
      on = false;
    }
  }
}

void display() {
  if (on == true) {
    noFill();
    strokeWeight(6);
    stroke(0, 250, 150, 180);
    ellipse(x, y, diameter, diameter);
  }
}
}

///////////////////////////////////////////////////////////////////////

class SpotRing {
  Spot sp;
  Ring circle = new Ring();
  SpotRing(int x, int y, float t, float p) {
  sp = new Spot(x, y, t, p);
  circle.start(x, y - p/2);
}

void transmit() {
  sp.move();
  sp.display();
  circle.grow();
  circle.display();
  if (circle.on == false) {
    circle.on = true;
  }
}
}

///////////////////////////////////////////////////////////////////////

SpotRing sr1, sr2;

void setup() {
  size(100, 100);
  smooth();
  sr1 = new SpotRing(33, 66, 25, 0.5);
  sr2 = new SpotRing(66, 90, 15, 1.5);
}

void draw() {
  background(20);
  sr1.transmit();
  sr2.transmit();
}


