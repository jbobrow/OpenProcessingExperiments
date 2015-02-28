
float d = 0;
void setup() {
  stroke(255);
  size(400, 400, P3D);
  strokeWeight(1);
}
void draw() {
  fill(0);
  d+=0.1;
  background(0);
  pushMatrix();
  translate(200+sin(d)*50, 200, cos(d) * 50);
sphere(50);
  popMatrix();
  pushMatrix();
  translate(200+sin(d-PI)*50, 200, cos(d-PI) * 50);
sphere(50);
popMatrix();
pushMatrix();
translate(200, 200+cos(d)*50, sin(d)*50);
sphere(50);
popMatrix();
pushMatrix();
translate(200, 200+cos(d-PI)*50, sin(d-PI)*50);
sphere(50);
popMatrix();
}
