
void setup() {
  size( 854, 480);
  smooth();
  frameRate(1);
}
void draw() {
  background (255);
  axe(width/2, height/2, ceil(random(70, 200)), 80*floor(random (0, 2)), ceil(random(1, 8)));
  nose(width/2, height/2-50, ceil(random(20, 100)), ceil(random(20, 100)), ceil(random(1, 8)));
  oh(width/2, height/2-100-ceil(random(20, 50)), ceil(random(20, 100)), ceil(random(20, 80)), ceil(random(50, 80)), ceil(random(1, 8)));
}

void axe( float x, float y, float w, float h, float weight ) {
  pushMatrix();
  translate(x, y);
  strokeWeight(weight);
  line(0-w, 0, w, h);
  line(0-w, h, w, 0);
  popMatrix();
}

void nose (float x, float y, float b, float c, float weight) {
  pushMatrix();
  pushStyle();
  noFill();
  strokeWeight(weight);
  ellipseMode(CENTER);
  translate(x, y);
  arc(0, 0, b, c, 0, PI, OPEN);
  popMatrix();
  popStyle();
}

void oh( float x, float y, float b, float w, float h, float weight) {
  pushMatrix();
  pushStyle();
  noFill();
  strokeWeight(weight);
  translate(x, y);
  ellipseMode(CENTER);
  ellipse(-b, 0, w, h);
  ellipse(b, 0, w, h);

  popMatrix();
  popStyle();
}
