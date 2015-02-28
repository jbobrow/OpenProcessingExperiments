
float x, x2, y, el = 14, r = 420, sz;
int theta = 0, col = 0, fuzz = 12;

void setup() {
  size(600, 600);
  x = width/2;
  y = height/2;
  strokeWeight(3);
  background(0, 0, 0);
  colorMode(HSB);
}

void draw() {
  //  background(0, 0, 0);
  noStroke();
  fill(0, 0, 0, 8);
  rect(0, 0, width, height);

  translate(x + random (-5,5), y + random (-5,5));
  rotate(radians(theta));
  stroke(col, 255, 255);
  fill(col, 255, 255);
  for (int i = 0; i < 360; i+=5) {
    pushMatrix();
    rotate(radians(i));
    x2 = map(i, 0, 360, 0, r);
    sz = map(i, 0, 360, 0, el);
    ellipse(x2, 0, sz + random(-fuzz, fuzz), sz + random(-fuzz, fuzz));
    popMatrix();
  }
  theta-=5;
  if (theta < -360) {
    theta = 0;
  }
  col+=1;
  if (col > 255) {
    col = 0;
  }
}

