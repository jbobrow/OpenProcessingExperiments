
void setup() {
  size(200,200);
  smooth();
}
void draw() {
  background(255);
  stroke(0);
  noFill();
  drawCircle(width/2,height/2,100);
}
void drawCircle(float x, float y, float r) {
  ellipse(x, y, r, r);
  if(r > 10) {
   drawCircle(x+r/2, y, r/2);
   drawCircle(x-r/2, y, r/2);
   drawCircle(x, y+r/2, r/2);
   drawCircle(x, y-r/2, r/2);
  }
}
