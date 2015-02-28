
float d;
void setup() {
  size(400, 400);
  stroke(0, 0, 255, 50);
  strokeWeight(15);
}
void draw() {
  background(255);
  fill(0);
  pushMatrix();
  for(int x = 0; x < width/75+2; x++) {
    for(int y = 0; y < height/75+2; y++) {
  d=atan2(mouseX-x*75, mouseY-y*75);
  line(x*75 + sin(d) * 75, y*75 + cos(d) * 75, x*75, y*75);
    }
  }
  popMatrix();
}
