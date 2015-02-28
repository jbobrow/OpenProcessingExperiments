
void setup () {
  size (900, 900);
  smooth();
}

void draw () {
  background (0);
  strokeWeight (.4);
  stroke (0);
  fill(58, 220, 104, 100-0);
  drawCircle (450, 450, 250);
  drawCircle (100, 100, 250);
  drawCircle (800, 800, 250);
  drawCircle (760, 20, 250);
  drawCircle (140, 880, 250);
  
  
  
}


void drawCircle (float x, float y, float radius) {
  ellipse (x, y, radius, radius);
  if (radius > 5) {
    drawCircle (x + radius/2, y, radius/2);
    drawCircle (x - radius/2, y, radius/2);
    drawCircle (x, y + radius-30, radius/2);
    drawCircle (x, y - radius+30, radius/2);
    
   
  }

}



