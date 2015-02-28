
void setup() {
  background(0);
  size(600, 600);
  noStroke();
  drawTriangle(width/2, height/2, width/2, height/2, height/2, width/2);
}


void drawTriangle(float x, float y, float x2, float y2, float x3, float y3) {
  fill(random(255), random(255), random(255), 150);
  triangle(x, y, width/3, height/2, width/3, height/3);

  if (x3 > 15) {
    drawTriangle(x + x3/2, y, x3/2, y, x3/2, y);
    drawTriangle(x - x3/2, y, x3/2, y, x3/2, y);
    drawTriangle(x, y + x3/2, x3/2, y, x3/2, y);
    drawTriangle(x, y - x3/2, x3/2, y, x3/2, y);
  }
}
