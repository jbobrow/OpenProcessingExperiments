

float treeSize = 100;
color from = color(150, 255, 120);
color to = color(70, 50, 80); 
color back = color(70, 200, 255);

void setup() {
  size(900, 480);
  background(back);
  smooth();
  stroke(0, 0, 0, 64);
  strokeCap(ROUND);
  noLoop();
}

void draw() {
  fill(back, 50);
  noStroke();
  rect(0, 0, width, height);
  drawTree(random(width), height);
}

void keyPressed() {
  redraw();
}

void drawTree(float x, float y) {
  pushMatrix();
  pushStyle();
  translate(x, y);
  scale(random(0.5, 1.0));
  drawBranch(1);
  popStyle();
  popMatrix();
}

void drawBranch(int level) {
  if (level > 16) return;
  float branchSize = -treeSize * pow(0.82 + random(0.02 * 2.) - 0.02, level);
  strokeWeight(0.1 * -(branchSize));
  stroke(lerpColor(to, from, level/16));
  line(0, 0, 0, branchSize);
  
  translate(0, branchSize);
  float thisAngle = 20 + random(45 * 2.) - 45;
  
  rotate(radians(-thisAngle));
  drawBranch(level + 1);
  
  rotate(radians(thisAngle));
  thisAngle = 20 + random(30 * 2.) - 30;  
  rotate(radians(thisAngle));
  drawBranch(level + 1);
  
  rotate(radians(-thisAngle));
  translate(0, -branchSize);
}



