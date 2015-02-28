
float deg = 0;
float rotateDeg = 0;
int len = 0;
float diagonalLineLen = 0;
void setup()
{
  size(640, 360);
  frameRate(12);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(0);

  diagonalLineLen = sqrt(width * width + height * height);
}

void draw()
{
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  
  float x = len * cos(deg);
  float y = len * sin(deg);
  translate(width / 2, height / 2);
  rotate(rotateDeg);
  noFill();
  stroke(deg, 100, 100, 5 + 95.0 * len / width);
  strokeWeight(2);
  bezier(-diagonalLineLen / 2, 0, -x, -y, x, y, diagonalLineLen / 2, 0);
  
  deg += 0.3;
  if (360 <= deg) {
    deg = 0;
  }
  rotateDeg -= 0.02;
  if (rotateDeg <= 0) {
    rotateDeg = 360;
  }
  
  len += 2;
  if (width <= len) {
    len = 0;
  }
}


