
float x, y;
float px, py;
void setup() {
  colorMode(HSB, 360, 100, 100);
  size(400, 400);
  background(0, 0, 100);
  smooth();
  x = 0;
  y = height/2;
  px = x;
  py = y;
}

void draw() {
  fill(0, 0, 100, 5);
  noStroke();
  rect(0, 0, width, height);
  fill(0);

  if (x > width) {
    background(0, 0, 100);
    x = 0;
    px = x;
  }

  y=noise(y+x)*height;
  color c = color(random(20, 360), 80, 80);
  fill(c);
  stroke(c);
  line(px, py, x, y);
  px = x;
  py = y;
  x += 5;
}


