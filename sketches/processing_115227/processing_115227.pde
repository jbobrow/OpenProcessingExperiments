
float a=1;
void setup() {

  size(500, 500, P3D);
  smooth();
}

void draw() {
  background(52);
  lights();
  noStroke();
  fill(232, 105, 86);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(a);
  rotateX(a);
  box(100);
  popMatrix();
  a=a+0.05;
}



