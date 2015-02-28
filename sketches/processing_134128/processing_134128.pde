
float t;
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
float x3 = 0;
flaot y3 = 0;

void setup() {
  size(1080, 720);
  t=0;
}

void draw() {
t += .1
  background(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(x + width/2, y + height/2, 25, 25);
  ellipse(x2 + width/2, y2 + height/2, 25, 25);
  ellipse(x3 + width/2, y3 + height/2, 25, 25);
  ellipse(width/2, height/2, 200,200);
  //println(t);
  x = 200 * cos(t);
  y = 20 * sin(t);
  x2 = 20 * sin(t);
  y2 = 200 * cos(t);
  x3 = 200 * cos(t);
  x4 = 200 * sin(t);

}
