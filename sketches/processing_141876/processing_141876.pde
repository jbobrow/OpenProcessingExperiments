
 
Orbit [] orbits = new Orbit [200];

void setup () {
size (700, 700);
smooth();


// use array to fill class with values
for (int i=0; i <orbits.length; i++) {
int r = 2*i; // radius of the circle
int r2 = 2*i; //radius of the orbit
float t = .005*i;
int rojo =200+i*3; //red
int verde = 125+i*2; //green
int azul = i*2; //blue
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
fill (rojo, verde, azul, 30);
noStroke ();

ellipse (width/2 + cos(theta)*r2, height/2 + sin(theta)*r2, r, r);

//increment theta
//increase to speed up movement

theta += t;

//increment s to change radius of circle
}
}
