
float rotacion = 0;
void setup() {
  size(500, 500, P3D);
  rectMode(CENTER);
}
void draw() {
  background(255);
  rotacion += 0.01;
  translate(width/2, height/2);
  rotateY(rotacion);
  rotateZ(rotacion*0.9);
  sphere(100);
}

