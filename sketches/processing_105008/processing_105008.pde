
//needing thinking ouside of the box, or in the box :) this was a bit tricky

int ypos;
int xpos;
int direction;

void setup() {
  size(500, 500);
  ypos=height/2;
  xpos=width/2;
  direction=1;
}

void draw() {
  background(255);
  if (ypos>=height || ypos<=0) {
    direction=(direction*-1);
  }
  ypos+=direction;
  fill(255,0,0);
  ellipse(xpos, ypos, 50, 50);
}



