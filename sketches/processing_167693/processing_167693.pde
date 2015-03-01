
/* @pjs preload= "peach.jpg"; */
PImage peaches;
int y = 0;
float x = 0;

void setup() {
  size(500,500);
  noStroke();
  peaches = loadImage("peach.jpg");
}

void draw() {
  image(peaches, 0,0, 500, 500);
  y = constrain(mouseY, 0, 499);
  x = PI;
  for (int i = 0; i < 100; i++) {
    color c = get(i, y);
    stroke(c);
    line(i+100, 0, i+100, 500);
  }
  stroke(255, y, y, mouseY);
  fill(255, y, y, y*PI);
  ellipse(50 *x, y+ x, 50*x, 5+x);
}




