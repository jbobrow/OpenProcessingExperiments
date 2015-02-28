
void setup() {
  size(400,400);
  smooth();
}

void draw() {

  background(245,221,125);
  noStroke();
  
  fill(0,255,255,20);
  drawEllipse(width/2,height/2,200);
}

void drawEllipse(float x, float y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 15) {

    drawEllipse(x + radius/2, y, radius/1.7);
    drawEllipse(x - radius/2, y, radius/1.7); 
  }
}
