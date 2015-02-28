
void setup() {
  size(400, 600);
  colorMode(HSB, 360, 100, 100);
  background(360);
  noLoop();
  smooth();

  rectMode(CENTER);
}

void draw() {
 rectangle(width/2, height/2, 150, 0);
}

void rectangle(float x, float y, float d, int n) {
  pushMatrix();
  translate(x, y);
  stroke(360, 50);
  fill(d*3, 100, 100, 50);
  rotate(radians(45*n));
  rect(0, 0, d, d);
  popMatrix();

  if (d > 10) {
    rectangle(x+d/2, y, d/2, n-1);
    rectangle(x-d/2, y, d/2, n-1);

    rectangle(x, y+d/1.5, d/1.5, n-1);
    rectangle(x, y-d/1.5, d/1.5, n-1);
  }
}


