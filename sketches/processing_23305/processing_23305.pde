
// declare the array and set size
Sinewave [] waves = new Sinewave [8];
void setup () {
size (900, 600);
smooth ();
// use array to fill class with values
for (int i=0; i <waves.length; i++) {
float xpos = width/(waves.length)*i + width/(waves.length)*(.5);
float ypos = height/2+80;
float theta = .6*i;
float tChange =.1;
int radius = 10;
int r = 50;
waves[i] = new Sinewave (xpos, ypos, theta, tChange, radius, r);
}
}
void draw () {
background (0);
// call the array to display all
for (int i = 0; i < waves.length; i++) {
waves[i].display();
}
}
class Sinewave {
// data
float xpos;
float ypos;
float theta;
float tChange;
int radius;
int r;
// constructor
Sinewave (float tempX, float tempY,float tempTheta, float tempTChange, int tempRadius, int tempR) {
xpos= tempX;
ypos= tempY;
theta = tempTheta;
tChange= tempTChange;
radius = tempRadius;
r = tempR;
}
//methods and functions
void display () {
rectMode(CENTER);
stroke (map (xpos, 0, width, 100, 255), 50+map(xpos, 0, width, 50, 200), map(xpos, 0, width, 0, 255));
strokeWeight(.8);
line (xpos, ypos + sin(theta+1)*r, xpos, cos(theta/2)*r+200);
line (xpos, ypos + sin(theta/3)*r+100+cos(theta/3)*50, xpos, sin(theta)*r+100);
noStroke();
fill (200+100*sin(theta), 150+80*cos(theta), map(xpos, 0, width, 0, 255));
rect (xpos, ypos + sin(theta)*r, radius+50, 95+cos(theta)*50);
//increment theta
theta += tChange;
}
}

