
/*
 * recursive function
 *
*/

void setup() {
  size(600, 600);
  smooth();
  noLoop();
  background(random(255));
}

void draw() {
  drawCircle(width/2, height/2, height, 8); //set the initial paramaters for the circle
}

//runs a recursive method that generates an elipse at half the area each time

void drawCircle(float x, float y, int radius, int level) {              
  fill(random(255), random(255)/level);
  stroke(random(255), random(255));
 ellipse(x, y, radius*2, radius*2);
  ellipse(x, y, radius*2, radius*2);
  if(level > 1){
    level--;
    drawCircle(x - radius/2, y - radius/2, radius/2, level);
    drawCircle(x - radius/2, y + radius/2, radius/2, level);
    drawCircle(x + radius/2, y - radius/2, radius/2, level);
    drawCircle(x + radius/2, y + radius/2, radius/2, level);
  }
}

