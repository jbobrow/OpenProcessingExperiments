
int x =0;
void setup() {
  size(600, 400);
}
void draw() {
  x = mouseX;
  background(255);
  noStroke();
  fill(255,0,0);
  if (x <width/2) {
    rect(0,0, width/2, height);
  }else {
    rect(width/2,0, width/2, height);
  }
}
