
SpotRing sr1, sr2;


void setup (){
  size (300, 300);
  smooth ();
  sr1= new SpotRing (33, 50, 0.1, 33);
  sr2 = new SpotRing (66, 70, 0.05, 66);
  
}

void draw (){
  background (0);
  sr1.transmit ();
  sr2.transmit ();
  
}



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
strokeWeight(4);
stroke(155, 153);
ellipse(x, y, diameter, diameter);
}
}
}

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
ellipse(x, y, diameter, diameter);
}
}



class SpotRing {
  Spot ovoid;
  Ring circle = new Ring();

SpotRing (int x, int y, float t, float sp){
  ovoid = new Spot(x, y, t, sp);
  circle.start (x, y-sp/2);
}

void transmit (){
  ovoid.move ();
  ovoid.display (); 
  circle.grow ();
  circle.display ();
  if (circle.on == false) {
    circle.on = true;
  }
}

}



