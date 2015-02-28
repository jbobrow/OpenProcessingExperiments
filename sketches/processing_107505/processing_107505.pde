
int d = 1;
float r = 0;

void setup() {
  size(displayWidth, displayHeight);
  background(0);
}

void draw() {
  background(0);
  r += 5;
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(r));
  drawCircle(0,0,1^d);
  d += 10;
  popMatrix();
}

void drawCircle(float x, float y, float radius) {
  int c = int(random(255));
  stroke(0);
  fill(int(random(255)),int(random(255)),int(random(255)),255);
  ellipse(x,y,radius,radius);
  if(radius > 2) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
  }
}
