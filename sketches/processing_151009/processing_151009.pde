
float angle;

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(#1DDB16);
  angle += 0.001;
  translate(width/2, height/2);
  for (int i=0; i<80; i++) {
    fill (255, 80);
    rotate(angle);
    rotateX(radians(mouseX));
    rotateY(radians(mouseY));
    box(300);
  }
}
