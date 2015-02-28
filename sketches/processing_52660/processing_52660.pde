
void setup() {
  size(800, 800);
  noStroke();
  smooth();
}

void draw() {   
  drawCircle(mouseX, 3200, 10 + mouseY/111);
}

void drawCircle(int x, int radius, int level) {                    
  float PEP = 126 * level/16.0;

  fill(PEP);
  ellipse(x, 360, radius*2, radius*2);      
  if (level > 1) {
    level = level - 1;
    drawCircle(x - radius/2, radius/2, level);
    drawCircle(x + radius/2, radius/2, level);
  }
}


