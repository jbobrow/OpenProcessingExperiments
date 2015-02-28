
PImage img;
Animation animation1, animation2, animation3, animation4, animation5;

float xpos = 100;
float ypos = 100;
float bx;
float by;
float speed = 3; 

void setup() {
  size(255,173);
  frameRate(24);
  img = loadImage("levelExample.png");
  animation1 = new Animation("up", 7);
  animation2 = new Animation("left",8);
  animation3 = new Animation("right",7;
  animation4 = new Animation("down", 6);
  animation5 = new Animation("restFrame", 2);
}

