
/* @pjs preload="runner.gif";*/
/* @pjs preload="middleground.gif";*/
/* @pjs preload="background.gif";*/

PImage runner;
PImage middleground;
PImage background;

int x = 0;

void setup() {
  size(1000, 500);
  runner = loadImage("runner.gif");
  middleground = loadImage("middleground.gif");
  background = loadImage("background.gif");
}

void draw() {
  float backgroundX=map(mouseX, 0, 1000, 0, -100);
  image(background, backgroundX, 0);

  float middlegroundX=map(mouseX, 0, 1000, -50, -500);
  image(middleground, middlegroundX, 0);

  image(runner, x, 200);

  // change the 1 to other numbers to speed up or slow down:  
  if (x>width) {
  x =-10;
  }
  // press mouse to run faster
  if (mousePressed) {
    x = x + 10;
  }
  else {
    x = x + 1;
  }
}

