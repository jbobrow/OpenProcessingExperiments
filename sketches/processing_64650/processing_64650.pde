
void setup() {
  size(500, 500);
  background(0);
  smooth();
  noStroke();
  frameRate(24);
}

int h=500/2;

float angle=0;

void draw() {
  angle+= TWO_PI/250;
  if (angle>TWO_PI) {
    angle = 0;
  }
  float xx = h*cos(angle);
  float yy = h*sin(angle);

  background(0);
  pushMatrix();
  translate(width/2, height/2);
  fill(255, 0, 0);
      rotate(angle);

  triangle(0, -h*xx/width, -h*yy/height, xx, h*yy/height, xx);
  triangle(0, h*xx/width, -h*yy/height, xx, h*yy/height, xx);

  popMatrix();
}
