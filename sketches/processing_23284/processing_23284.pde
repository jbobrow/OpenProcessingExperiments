
//declare array and set size of 100

Orbit [] orbits = new Orbit [100];

void setup () {
size (400, 400);
smooth();

// use array to fill class with values
for (int i=0; i <orbits.length; i++) {
int r = int (random (100));
int r2 = int (random (300));
float t = random (.01, .1);

orbits[i] = new Orbit ( 0, r, r2, t);
}
}

void draw () {
background (10);
noStroke ();

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

//constructor
Orbit (float tempTheta, int tempR, int tempR2, float tempT) {
theta = tempTheta;
r = tempR;
r2 = tempR2;
t = tempT;
}

//methods and functions

void move () {
  stroke(1,30);
  //blue
    fill (46,169,245, random (50,100));
  ellipse (50 + cos(theta)*r2/4, height + sin(theta)*r2, r+50, r+50);
 
     fill (46,210,200, random (80,100));
  ellipse (150 + cos(theta)*r2/4, height + sin(theta)*r2, r, r);
  
  //green
   fill (17,245,117, random (50,100));
  ellipse (200 + cos(theta)*r2/4, height + sin(theta)*r2, r+50, r+50);
  
     fill (25,210,117, random (80,100));
  ellipse (250 + cos(theta)*r2/4, height + sin(theta)*r2, r, r);
   

  
  //red
 
  fill (230,42,42, random (80,100));
  ellipse (350 + cos(theta)*r2/4, height + sin(theta)*r2,r+50, r+50);
  
  fill (255,42,42, random (80,100));
  ellipse (400 + cos(theta)*r2/4, height + sin(theta)*r2, r, r);
 

 


//increment theta
//increase to speed up movement

theta += t;

//increment s to change radius of circle
}
}

