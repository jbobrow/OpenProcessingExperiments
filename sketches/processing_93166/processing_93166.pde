
float d;
void setup() {
  size(400, 400);
  stroke(0, 0, 255, 50);
  strokeWeight(10);
}
void draw() {
  background(255);
  fill(0);
  pushMatrix();
  for(int x = 0; x < width/20+2; x++) {
    for(int y = 0; y < height/20+2; y++) {
  d=atan2(mouseX-x*20, mouseY-y*20)-PI;
  line(x*20 + sin(d) * 20, y*20 + cos(d) * 20, x*20, y*20);
    }
  }
  popMatrix();
}
