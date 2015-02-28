
void setup() {
  size(500, 500, P3D); 

}

void draw() {
  background(300);
  stroke(355, 150);
  translate(150, 150, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 4);
  sphere(100);
}

