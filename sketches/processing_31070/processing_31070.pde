
int x;
int y;
int w = 500;
int z = 0;
int speed=3;
void setup() {
  size(500,500);
  background(color(0));
  frameRate(30);
}
void draw() {
  y = x+speed;
  x = y+0;
  w = w-5;
  z = z+5;
  background(0);
  fill(random(255),random(255),random(255));
  noStroke();
  ellipse(250,y,40,40);
if (y>490) {
speed= -speed;
}
if (y<1) {
speed= -speed;
}
}
