
EggRing er1, er2, er3, er4, er5, er6, er7, er8;
void setup() {
size(400, 400);
smooth();
er1 = new EggRing(53, 76, 0.1, 33);
er2 = new EggRing(266, 290, 0.05, 66);
er3 = new EggRing(123, 176, 0.1, 33);
er4 = new EggRing(326, 90, 0.05, 99);
er5 = new EggRing(23, 376, 0.15, 110);
er6 = new EggRing(200, 220, 0.05, 66);
er7 = new EggRing(88, 376, 0.1, 44);
er8 = new EggRing(380, 190, 0.05, 88);
}
void draw() {
background(0);
er1.transmit();
er2.transmit();
er3.transmit();
er4.transmit();
er5.transmit();
er6.transmit();
er7.transmit();
er8.transmit();
}
class Egg {
float x, y; // X-coordinate, y-coordinate
float tilt; // Left and right angle offset
float angle; // Used to define the tilt
float scalar; // Height of the egg
// Constructor
Egg(int xpos, int ypos, float t, float s) {
x = xpos;
y = ypos;
tilt = t;
scalar = s / 100.0;
}
void wobble() {
tilt = cos(angle) / 2;
angle += 0.06;
}
void display() {
noStroke();
fill(220,100,30,160);
pushMatrix();
translate(x, y);
rotate(tilt);
scale(scalar);
ellipse(0,-50,80,80);
//beginShape();
//vertex(0, -100);
//bezierVertex(25, -100, 40, -65, 40, -40);
//bezierVertex(40, -15, 25, 0, 0, 0);
//bezierVertex(-25, 0, -40, -15, -40, -40);
//bezierVertex(-40, -65, -25, -100, 0, -100);
//endShape();
popMatrix();
}
}
class Egg2 {
float x, y; // X-coordinate, y-coordinate
float tilt; // Left and right angle offset
float angle; // Used to define the tilt
float scalar; // Height of the egg
// Constructor
Egg2(int xpos, int ypos, float t, float s) {
x = xpos;
y = ypos;
tilt = t;
scalar = s / 100.0;
}
void wobble() {
tilt = sin(angle) / 3;
angle += 0.06;
}
void display() {
noStroke();
fill(20,130,230,180);
pushMatrix();
translate(x, y);
rotate(tilt);
scale(scalar);
ellipse(0,-50,80,80);
//beginShape();
//vertex(0, -100);
//bezierVertex(25, -100, 40, -65, 40, -40);
//bezierVertex(40, -15, 25, 0, 0, 0);
//bezierVertex(-25, 0, -40, -15, -40, -40);
//bezierVertex(-40, -65, -25, -100, 0, -100);
//endShape();
popMatrix();
}
}
class EggRing {
Egg ovoid;
Egg2 ovoid2;
Ring circle = new Ring();
EggRing(int x, int y, float t, float sp) {
ovoid = new Egg(x, y, t, sp);
ovoid2 = new Egg2(x+38, y+23, t, sp);
circle.start(x, y - sp/2);
}
void transmit() {
ovoid.wobble();
ovoid.display();
ovoid2.wobble();
ovoid2.display();
circle.grow();

circle.display();
if (circle.on == false) {
circle.on = true;
}
}
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
diameter += 0.08;
if (diameter > 400) {
on = false;
}
}
}



void display() {
if (on == true) {
noFill();
strokeWeight(10);
stroke(150,220,100, 155);
ellipse(x, y, diameter, diameter);
}
}
}


