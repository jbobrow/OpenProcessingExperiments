

int value = 0;

  void setup() {
  size(500, 500, P3D); 
}

void draw() {
  background(200);
  stroke(255, 50);
  translate(50, 50, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 4);
  sphere(40);

}

/*void mousePressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}*/



