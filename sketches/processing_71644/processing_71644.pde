
float deg = 0;

void setup() {
  size(500, 500);
  background(255, 255, 255);
  rectMode(CENTER);
  smooth();
  frameRate(20);
  noStroke();
}
void draw() {
  translate(width/2, height/2);
  for (int i = 0; i < 1000; i+=10) {
    spiral(i);
  }
  deg++;
  if (mousePressed ==true) {
    background(255, 255, 255);
    deg = 0;
  }
}

void spiral(int x) {
  fill(255, 255, 255, 20);
  ellipse(0, 0, deg/2, deg*deg/2);

  fill(255, 162, 192);
  rotate(radians(20+deg/2));
  ellipse(x, 0, 50+x/2, 50+x/2);

  fill(162, 209, 255);
  rotate(radians(20+deg/2));
  ellipse(x, 0, 50+x/2, 50+x/2);

  fill(231, 240, 194);
  rotate(radians(20+deg/2));
  ellipse(x, 0, 50+x/2, 50+x/2);
}
