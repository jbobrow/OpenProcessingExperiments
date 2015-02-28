
void setup() {
  size(400, 400, P3D);
  background(0);
}
void draw() {
if (mousePressed) {
    background(0);
    stroke(100);
    lights();
    translate(200, 200, 0);
    rotateX(mouseY*0.01);
    rotateY(mouseX*0.01);
    sphere(30);
    stroke(random(100,150));
    lights();
    translate(150, 150, 0);
    rotateX(mouseY*0.05);
    rotateY(mouseX*0.05);
    sphere(20);
  }
}


