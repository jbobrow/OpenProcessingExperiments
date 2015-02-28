

int diameter = 50;

int xdistance = diameter/2;
int ydistance = diameter/2;


int xspeed = 10;
int yspeed = 20;


int ydirection = 1;
int xdirection = 1; 


void setup() {
  size(800, 800);
  background(100);
  fill(150, 109, 255);
  noStroke();
}
void draw() {
  background(100);
  ellipse(xdistance, ydistance, diameter, diameter);
  rectMode(CENTER);
  rect(mouseX, height-75, 200, 20);
  xdistance += xspeed*xdirection;
  ydistance += yspeed*ydirection;

  //bottom hit
  //if (ydistance>height-diameter/2) {
    if(ydistance>height-100){
    ydirection = -ydirection;
  }

  //top hit
  if (ydistance<0+diameter/2) {
    ydirection=-ydirection;
  }

  //right hit
  if (xdistance>width-diameter/2) {
    xdirection = -xdirection;
  }

  //left hit
  if (xdistance<0+diameter/2) {
    xdirection=-xdirection;
  }
}

