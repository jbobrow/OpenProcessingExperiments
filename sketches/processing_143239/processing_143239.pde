
void setup() {
  size(640,360);
}
 
void draw() {
  background(255);
  drawCircle(width/2,height/2,200);
}
 
void drawCircle(float x, float y, int radius) {
  
  float h = random(0, 360);

  
  stroke(0);
for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
  if(radius > 2) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
 
  }
}

