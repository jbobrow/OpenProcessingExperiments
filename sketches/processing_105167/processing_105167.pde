
int xpos;
int ypos;

int velocity;

void setup() {
  size(500, 500);
  background(50);
  xpos=width/2;
  ypos=height/2;
  velocity=100;
}

void draw() {
  background(210);

  ypos=ypos+velocity;

//I borrowed my if statement from someone else's bouncy ball code.
//I can't seem to understand exactly why it works the way it works.
//The rest of the code is mine.

  if (ypos<=20||ypos>=width-20) {
    velocity=velocity*(-1);
  }

  fill(250, 255, 0);
  ellipse(xpos, ypos, 10, 10);
}



