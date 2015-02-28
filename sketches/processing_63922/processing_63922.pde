
void setup() {
  size(400, 400);
  smooth();
   
  frameRate(300);
}
 
void polygon(int x, int y, int r, int s, float o) {
  beginShape();
  for(int i = 0; i < s; i ++) {
    float xp = x + cos(o + TWO_PI / s * i) * r;
    float yp = y + sin(o + TWO_PI / s * i) * r;
    vertex(xp, yp);
  }
  endShape(CLOSE);
}
 
void draw() {
  background(255);
  polygon(width / 2, height / 2, 100, mouseY / 50 + 3, mouseX / 50.0);
}
