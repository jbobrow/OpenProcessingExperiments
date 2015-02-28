
float px, py;
float angle;
float radius = 50;
float frequency = 2;
float x;
int direc=1;


void setup() {
  size(500, 200);
  background (255);
}

void draw() {
  background (255);
  py = height/2+sin(radians(angle))*(radius);
  fill(0);
  noStroke();
 
  ellipse(x, py, 10, 10);
  angle += frequency;
  if (x > 0 || x < width) {
    direc *= 1;
  }

  if (x < 0 || x > width) {
    direc *= -1;
  }
  x = x + ( direc);
}


