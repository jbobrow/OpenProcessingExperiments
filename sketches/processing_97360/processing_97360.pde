
float angle = 0;

void setup() {
  size(700, 400, P3D);
  smooth();
  sphereDetail(25, 30);
  stroke(255);
  strokeWeight(0.7);
  background(0);
  camera(width/2, height/2.0, (height/2) / tan(PI*38.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
}

void draw() {
  background(0);

  pushMatrix();
  noFill();
  stroke(74, 75, 191);
  translate(width/2, height/2, -(mouseX*5 - 250));
  rotate(radians(7));
  rotateY(angle);
  sphere(110);
  popMatrix();

  pushMatrix();
  noFill();
  stroke(174, 189, 240);
  translate(width/2, height/2);
  rotate(radians(7));
  rotateY(angle*8);
  sphere(90);
  popMatrix();

  angle += 0.003;
}



