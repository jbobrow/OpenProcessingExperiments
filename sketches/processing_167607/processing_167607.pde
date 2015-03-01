
/* @pjs preload="pinkdot.jpg, greencell.jpg"; */

float angle = 0.0;
float d = 5.0;
float speed = 1.0;
int direction = 1;
PImage img;

void setup() {
  size(500,500);
  smooth();
  noStroke();
  fill(255, 204);
}

void draw() {
  fill(0,12);
  img = loadImage("Screen Shot 2014-07-03 at 12.02.38 PM.jpg");
 rect(0,0,width,height);
   fill(60, 255, 200, 60);
  //fill(255, 200, 40, 150);
  angle = angle + 0.02;
  translate(270, 240);
  rotate(angle);
  triangle(-30, -30, 60, 60, 20, -20);

  
  fill(90, 90,250, 90);
  triangle(-30, -30, 60, 60, 20, -20);
  triangle(100, 50, d/3, d/4, 20, 20);
  triangle(50, 0, d/2, d/5, 20, -20);
  //ellipse(50, 100, d, d);
  d += speed * direction;
  if (( d> width) || (d < width/100)) {
  direction = -direction;

  }
}



