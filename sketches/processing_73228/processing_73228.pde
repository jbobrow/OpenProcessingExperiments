
http://www.openprocessing.org/sketch/73226#
int x;
int y;
float inc = 500;
int h = 500;
int w = 500;
int ripples =5;

void setup() {
  size(700, 700);
  smooth();
  frameRate(5);
  y = h/2;
  x = w/2;
}


void draw() {
  fill(random(255), random(255), random(255), ripples*5);
  noStroke();
    for (int x=30;x<=700;x+=30) {
    for (int y=30;y<=700;y+=30) {
      float r=random(50);
      ellipse(x+r, y+r, 20, 20);
      ellipse(x-r, y-r, 20, 20);
          }
  }
      stroke(255);
      strokeWeight(3);
      rect(random(width/2), random(height), random(width), random(height/2));
      strokeWeight(1);
      triangle(random(width/4), random(height), random(width), random(height/4), random(width), random(height));
}
