
/* @pjs preload="globe.jpg"; */

PImage globe;
int y=0;

void setup() {
  size(600, 620);
    globe = loadImage("globe.jpg");
}

void draw() {
  image(globe, 0, 0);
  y=constrain(mouseY,0,619);
  for(int i=100;i<400;i++){
    color c=get(i,y);
    stroke(c);
    line(i+60,290,i+60,330);
  }
  
  }


