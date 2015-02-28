
void setup() {
  size(500, 500, P3D);
  background(0);
}
void draw() {
  background(0);
  translate(width/2, height/2-100, -500);
  for (int i=0; i<15; i++) {
    box(200-(i*25), 50, 200-(i*25));
    translate(0, 50, 0);
  }
  camera(mouseX*3, mouseY*3, 500, width/2, height/2, 0, 0, 1, 0);
}
