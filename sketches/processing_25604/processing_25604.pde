
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
strokeWeight(.5);
rect (xpos, ypos + sin(theta+1)*r, xpos, cos(theta/2)*r+200);
rect (xpos, ypos + sin(theta/3)*r+100+cos(theta/3)*50, xpos, sin(theta)*r+100);
noStroke();

fill (100+100*sin(theta), 150+80*cos(theta), map(xpos, 0, width, 0, 255),20);
rect (xpos, ypos + sin(theta)*r, radius+50, 100+cos(theta)*50);

//increment theta

theta += tChange;
}
}

