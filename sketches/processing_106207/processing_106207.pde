
int w=500;
int h=500;
void setup() {
  size(500, 500, P3D);
  sphereDetail(12);

}
void draw() {
  background(255);


  for (int y =25; y <w; y=y+50) {
    for (int x = 25; x < h; x=x+50) {

  rotateZ(radians(mouseX*PI/width));
  rotateY(radians(mouseY*PI/height));
      sol(x, y);
    }
  }
}
void sol(int x, int y) {
  pushMatrix();

  fill(200, 200, 50);
  translate(x, y,0);
  sphere(50);
  fill(200);
  translate(0, 0, 50);
  sphere( 20);
  popMatrix();
}
