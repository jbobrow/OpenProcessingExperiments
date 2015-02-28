
void setup () {
  size (900, 900);
  smooth();
}

void draw () {
  background (255);
  strokeWeight (.4);
  stroke (0);
  fill(58, 20, 104, 100-0);
  drawCircle (450, 550, 250);
  drawCircle (200, 150, 100);
  drawCircle (700, 150, 100);
  drawCircle (700, 800, 50);
  drawCircle (200, 800, 50);
}


void drawCircle (float x, float y, float radius) {
  ellipse (x, y, radius, radius);
  if (radius > 5) {
    drawCircle (x + radius/2, y, radius/2);
    drawCircle (x - radius/2, y, radius/2);
    drawCircle (x, y + radius/2, radius/2);
    drawCircle (x, y - radius+30, radius/2);
    
   
  }

}



