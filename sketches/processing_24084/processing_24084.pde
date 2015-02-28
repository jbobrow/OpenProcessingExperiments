
void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(255, 0, 0);
  translate(250, 250);
  rotate(radians(-90));
  stroke(200, 0, 0);
  ellipse(0, 0, 500, 500);
  fill (255,0,0);

  pushMatrix();
  float h = hour();
  float hModulo = h % 12;
  float hMapped = map(hModulo, 0, 12, 0, 360);
  rotate(radians(hMapped));
  stroke(hMapped, 100, 100);
  strokeWeight(20);
  ellipse(0, 0, 400, 400);
  popMatrix();




  pushMatrix();
  float m = minute();
  float mMapped = map(m, 0, 60, 0, 360);
  rotate(radians(mMapped));
  stroke(mMapped, 100, 100);
  strokeWeight(30);
  ellipse(0, 0, 300, 300);
  popMatrix();

  pushMatrix();
  float s = second();
  float sMapped = map(s, 0, 60, 0, 360);
  rotate(radians(sMapped));
  strokeWeight(40);
  stroke(sMapped, 100, 100);
  ellipse(0, 0, 180, 180);
  popMatrix();
}


