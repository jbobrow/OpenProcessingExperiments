
//http://www.openprocessing.org/sketch/23302//

//declare array and set size of 100
Orbit [] orbits = new Orbit [50];
Orbit [] orbits2 = new Orbit [100];
int i = 0;
PImage img0; 
 
void setup () {
size (700, 500);
img0 = loadImage ("microwave.jpg");
smooth();
noStroke();
// use array to fill class with values
for (int i=0; i <orbits.length; i++) {
int r = int (random (10, 30));
int r2 = int (random (10, 1));
float t = random (.01, .02);
orbits[i] = new Orbit ( 0, r, r2, t);
}
 
for (int i=0; i <orbits2.length; i++) {
  
int r = int (random (10, 50));
int r2 = int (random (45, 50));
 
float t = random (.01, .05);
 
orbits2[i] = new Orbit ( 0, r, r2, t);
}
}
void draw () {
image (img0,0, 0);
  

// call the array to display all the circles
for (int i = 0; i < orbits.length; i++) {
orbits[i].move();
}
for (int i = 0; i < orbits2.length; i++) {
orbits2[i].move();
}
}
  
  
class Orbit {
//data (variables)
float theta; //theta is angle
int r; //radius of circle
int r2; //radius of orbit
int r3; //radius of orbit
float t;
//constructor
Orbit (float tempTheta, int tempR, int tempR2, float tempT) {
theta = tempTheta;
r = tempR;
r2 = tempR2;
t = tempT;
}
 
 
//methods and functions
void move () {
  fill(random(200,10),random(50,600),0,10);
ellipse (width/1.6 + cos(theta)*r2, height/2.5 + sin(theta)*r2, r, r);
ellipse (width/2.3 + cos(theta)*r3, height/1.5 + sin(theta)*r3, r, r);
 fill(random(100),random(50,200),0,10);
rect (width/1.7 + cos(theta)*r2, height/1.7 + sin(theta)*r2, r, r);
 fill(random(300,10),random(100,200),0,10);
rect (width/2.3 + cos(theta)*r2, height/2.3 + sin(theta)*r2, r, r);
 fill(random(100,10),random(50,200),0,10);
ellipse (width/2.3 + cos(theta)*r2, height/1.5 + sin(theta)*r2, r, r);

//increment theta
//increase to speed up movement
theta += t;
//increment s to change radius of circle
}
}




