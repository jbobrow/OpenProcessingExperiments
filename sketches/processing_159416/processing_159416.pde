
void setup() {
  size(800,650);
}

void drawCircles(int x, int y, float radius) {
  fill(120,45,70,radius);
  ellipse(x, y -=(.2 * y), radius, radius);
  drawTriangle(x, (int)(y + radius), (int)(x+ radius), y, (int)(x - radius), y);
  fill(radius + 50);
  ellipse(x, y += (.2 * y), radius, radius);
  if(radius > 5) {
    radius *= 0.55f;
    drawCircles(x *= .7, y *= .7, radius);
  }
}

void drawTriangle(int x, int y, int x2, int y2, int x3, int y3) {
  fill(50 + y, 130 + x, 20, 30);
  triangle (x,y, x2, y2, x3, y3);
}
 
void draw() {
  background(240,240,250);
  drawCircles(400,400,500);
  drawCircles(700,700,300);
}

