
int count;

void setup()
{
  size(500, 500);
  noStroke();
  smooth();
  background (256, 256, 256);
  drawCircles(250, 250, 15, 8); 
}
 
void draw() {
  fill(random(0,255), random(0,255), random(0,255));
  float drip = int (random(5));
  ellipse(mouseX, mouseY, drip, drip);
}
   
void mousePressed() {
  drawCircles(mouseX, mouseY, 15, 8); 
  count = 0;
}   
 
void drawCircles(float x, float y, float radius, int level)
{
  noStroke();
  if(count != 0){
    fill (random(0,255), random(0,255), random(0,255));
  }
  else{
    fill(0,0,0,0);
  }
  count++;
  ellipse(x, y, radius, radius);
  if (level > 1) {
    level = level - 1;
    int num = int (random(2, 5));
    for(int i=0; i<num; i++) {
      float a = random(0, TWO_PI);
      float nx = x + cos(a) * 6.0 * level + random(-100,100);
      float ny = y + sin(a) * 6.0 * level + random(-100,100);
      drawCircles(nx, ny, radius/1.5, level);
    }
  }
}
