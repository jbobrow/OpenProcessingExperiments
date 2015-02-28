
/**
 * A demonstration of recursion, which means functions call themselves. 
 * Improved from example by Dominik Schmid, 2011
 */
 
void setup() {
  size(600, 600);
  smooth();
  noStroke();  // no outline
  fill(0, 70);  // black with tranparancy
  ellipseMode(RADIUS); 
}

void draw() {
  background(200);
  
  int level = int( map(mouseX, 0,width, 0,10) );  // int() because of type conversion
  drawCircle(width/2, height/2, level);
  
  println("level=" + level);  // debug statement
}

// the recursive function
void drawCircle(int x, int radius, int level) {                    
  ellipse(x, height/2, radius, radius);
  
  if(level > 0) {  // to stop infinite recursion
    drawCircle(x - radius/2, radius/2, level-1);
    drawCircle(x + radius/2, radius/2, level-1);
  }
}

