
//declare array and set size of 100

Orbit [] orbits = new Orbit [100];

void setup () {
size (400, 400);
smooth();

// use array to fill class with values
for (int i=0; i <orbits.length; i++) {
int r = 2*i; // radius of the circle
int r2 = 2*i; //radius of the orbit
float t = .005*i;

orbits[i] = new Orbit ( 0, r, r2, t);
}
}

void draw () {
background (230);

stroke (0,203,203,50);
strokeWeight (50);
fill(255,9);
ellipse (width/2,height/2,250,250);
ellipse (width/2,height/2,50,50);
ellipse (width/2,height/2,450,450);

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
Orbit (float tempTheta, int tempR, int tempR2, float tempT ) {
theta = tempTheta;
r = tempR;
r2 = tempR2;
t = tempT;

}

//methods and functions

void move () {
fill (0,203,203, 10);
stroke(0,203,203,30);
strokeWeight (5);

ellipse (width/2 + cos(theta)*r2, height/2 + sin(theta)*r2, r, r);




//increment theta
//increase to speed up movement

theta += t;

//increment s to change radius of circle
}
}

