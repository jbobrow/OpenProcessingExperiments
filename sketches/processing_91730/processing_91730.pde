
//  
//  Hot/Cold Line
//  Draws a blue (cold) line when moved slowly and a red
//  (hot) one when moved quickly
//  Creates a pattern depending on speed as well
//
//  Jürg Dietrich
//  2.3.2013
//
//  Calculation of speed adapted from
//  http://www.processing.org/learning/topics/pattern.html
//


void setup() {
  size(800,800);
  background(0);
}
 
void draw() {
  if (mousePressed)
  hotColdLine(mouseX, mouseY, pmouseX, pmouseY);
}

 
void hotColdLine(int x, int y, int px, int py) {
  
  float speed = 3*(abs(x-px) + abs(y-py));
  int strokewt = (int) (10-speed/10);
  if (strokewt < 1) strokewt=1;
  
  strokeWeight(strokewt);
  stroke(speed,0,255-speed);
  
  line(px+speed/20, py-speed/20, x, y);
  line(px-speed/20, py+speed/20, x, y);
  line(px, py, x+speed/20, y-speed/20);
  line(px, py, x-speed/20, y+speed/20);
}


