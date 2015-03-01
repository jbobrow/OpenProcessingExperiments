
int radius = 40;
int y = 375;
float s = 60;
float x = 110;
float speed = 2.5;
int direction = 1;
float velo = 1.1;
int heading = 1;

void setup() {
  frameRate(30);
  size(800, 600);
  noStroke();
  smooth();
  ellipseMode(RADIUS);
  background(204, 255, 255);
}
  void draw() {
    background(204, 255, 255);
    x += speed * direction;
  if ((x > width-radius) || (x < radius)) {
    direction = -direction;
  }
  if (direction == 1) {
   fill (255, 0, 0);
   arc (x, y, radius, radius, 0.00, 3.14);
   fill (0, 204, 0);
   triangle( x, y, x+35, y-35, x, y-70);
  } else {
    fill (255, 0, 0);
   arc (x, y, radius, radius, 0.00, 3.14);
   fill (0, 204, 0);
   triangle( x, y, x-35, y-35, x, y-70);
  }
  
  s += velo * heading;
  if ((s > width-radius) || (s < radius)) {
    heading = -heading;
  }
  if (heading == -1) {
   fill (255, 255, 1);
   ellipse(s, y-250, 50, 50);
  } else {
   fill (255, 255, 1);
   ellipse(s, y-250, 50, 50);
  }
  fill(0, 102, 204);
  rect(1, 400, 800, 200);
}
