
//declare array and set size of 100
Orbit [] orbits = new Orbit [100];
Orbit [] orbits2 = new Orbit [150];

void setup () {
size (400, 400);
smooth();
noStroke();
// use array to fill class with values
for (int i=0; i <orbits.length; i++) {
int r = int (random (10, 80));
int r2 = int (random (20, 1));
float t = random (.01, .08);
orbits[i] = new Orbit ( 0, r, r2, t);
}

for (int i=0; i <orbits2.length; i++) {
int r = int (random (10, 50));
int r2 = int (random (50, 180));

float t = random (.01, .08);

orbits2[i] = new Orbit ( 0, r, r2, t);
}
}
void draw () {
background (0);
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
  fill(random(255,50),random(130,40),0,50);
ellipse (width/2 + cos(theta)*r2, height/2 + sin(theta)*r2, r, r);
ellipse (width/2 + cos(theta)*r3, height/2 + sin(theta)*r3, r, r);
//increment theta
//increase to speed up movement
theta += t;
//increment s to change radius of circle
}
}

