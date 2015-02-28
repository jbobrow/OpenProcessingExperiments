
int xmotion = 120;
int ymotion = 120;
int radius = 50;
int xspeed = 6;
int yspeed = 6;
int xdirection = 1;
int ydirection = 1;

void setup() {
  size(800, 800);
  background(0);
}

void draw () {
//  background(random(0, 50), 50);
noStroke();
fill(random(0,50), 50);
rect(0, 0, 800, 800);
fill(230);
  rect(mouseX, 0, 200, 50);
  fill(random(0,200), random(0, 200), 200);
  ellipse(xmotion, ymotion, radius, radius);
  ymotion += yspeed*ydirection; //moving
  xmotion += xspeed*xdirection; //moving
  //Am I hitting the bottom?
  if (ymotion> height- radius/2) {
    ydirection = -ydirection;
  }
  //Am I hitting the top?
  if (ymotion< 0+ radius/2) {
    ydirection = -ydirection;
  }
  //Am I hitting the right?
  if (xmotion> width- radius/2) {
    xdirection= -xdirection;
  }
  //Am I hitting the left?
  if (xmotion< 0+ radius/2) {
    xdirection = -xdirection;
  }
  //Am I hitting the box?
  if (ymotion< 0+ radius/2 + 50 && xmotion< mouseX + 200 && xmotion> mouseX) {
    ydirection = -ydirection;
    ymotion += radius;
  }
}
