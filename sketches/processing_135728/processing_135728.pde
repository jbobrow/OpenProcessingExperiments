
void setup() {
  size(600, 600, P3D);
  noCursor();
}

void draw() {
  lights();
  fill (random(255), random(255), random(255));
  translate(mouseX, mouseY, 200);
  sphere(random(25));
  translate(mouseX, mouseY, 0); 
  rotateY(0.5);
  fill(random(255), random(255), random(255), random(255));
  box(40);

}

void mousePressed () {

  background(random(255));
}
