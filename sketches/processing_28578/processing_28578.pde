
//declare array and set size of 100

Orbit [] orbits = new Orbit [120];

void setup () {
size (400, 400);
smooth();

// use array to fill class with values
for (int i=0; i <orbits.length; i++) {
int r = 2*i; // radius of the circle
int r2 = 3*i; //radius of the orbit
float t = .001*r;
int rojo = i*3; //red
int verde = i*2; //green
int azul = 255-i*2; //blue
orbits[i] = new Orbit ( 0, r, r2, t, rojo, verde, azul);
}
}

void draw () {
background (0);

// call the array to display all the circles
for (int i = 0; i < orbits.length; i++) {
orbits[i].move();
}
}

class Orbit {

//data (variables)

float theta; //theta is angle
int r; //radius of circle
int r2; //radius of orbit
float t;
int rojo;
int verde;
int azul;

//constructor
Orbit (float tempTheta, int tempR, int tempR2, float tempT, int tempRojo, int tempVerde, int tempAzul) {
theta = tempTheta;
r = tempR;
r2 = tempR2;
t = tempT;
rojo = tempRojo;
verde = tempVerde;
azul = tempAzul;
}

//methods and functions

void move () {
  //frameRate(10);
stroke (rojo, verde, azul, 30);
//noStroke ();
strokeWeight(10);
rectMode(CENTER);
line ( width/2 + cos(theta)*r2,r, height/2 + sin(theta)*r2,r*2);

//increment theta
//increase to speed up movement
         
theta += t*.5;






//increment s to change radius of circle
}
}

