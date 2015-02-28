

void setup() {
  size(720, 480);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}
 
void draw() {
  background(204);
  drawRobot(120, 420, 120, 140);
  drawRobot(270, 460, 260, 95);
  drawRobot(420, 310, 80, 10);
  drawRobot(570, 390, 180, 40);
}

void drawRobot(int x, int y, int bodyHeight, int neckHeight) {
  
  int radius = 45;
  int ny = y - bodyHeight - neckHeight - radius; 
  
  
   
// Neck
  stroke(102);
  line(x, y-bodyHeight, x, ny);
  line(x+2, y-bodyHeight, x+2, ny);
  line(x+4, y-bodyHeight, x+4, ny);
   
// Body
  noStroke();
  fill(102);
  ellipse(x, y-33, 33, 33);
  fill(0);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill(#810804);
  rect(x-65, y-bodyHeight, 20, bodyHeight-60);
  rect(x+45, y-bodyHeight, 20, bodyHeight-60);
  
   
// Head
  fill(0);
//  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x-8, ny-6, 14, 14);
  fill(0);
  ellipse(x-8, ny-6, 3, 3);
  
  fill(255);
  ellipse(x+12, ny-6, 14, 14);
  fill(0);
  ellipse(x+12, ny-6, 3, 3);
}


