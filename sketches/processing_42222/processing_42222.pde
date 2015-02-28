
void setup() {
  size(400, 400);
}


void draw() {
  background(200);
  noStroke();
  fill(200,100,78);
  triangle(0,0, 400,0,400,400);  
  
  fill(100,80,200);
  ellipse(0,0,100,100);
  ellipse(0,400,100,100);
  ellipse(400,0,100,100);
  ellipse(400,400,100,100);
  
  drawCross(mouseX-25, mouseY-25, 50);

} 

void drawCross(float x, float y, float crossSize) {
  stroke(255, 40, 180);
  strokeWeight(4);
  line(x, y, x + crossSize, y + crossSize);
  line(x + crossSize, y, x, y + crossSize);
}



