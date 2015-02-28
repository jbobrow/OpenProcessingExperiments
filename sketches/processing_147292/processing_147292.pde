
float maxAnkleDiff = 0.7;  //max radians a branch has to its motherbranch
float maxAnkleTrunk = 0.2; //max radians the trunk has to the floor 
int minDepth = 2;          //how deep do you have to go
int maxDepth = 11;         //how deep is it possible to go
int depth = 9;             //start depth

void setup() {
  size(900, 480);
  background(0,104,139);
}

void draw() {

}

void mousePressed() {
  if ( mouseButton == LEFT) {
    if(depth < maxDepth) depth++;
  }
  if (mouseButton == RIGHT) {
    if(depth > minDepth) depth--;
  }
  background(0,104,139);
  text("ITERATIONS: " + depth, width - 100, 20);
  
  int startLength = 100;
  
  int startX = 800/2 - 2;
  int startY = 480; 
  
  drawTree(startX, startY, startLength, 0, 0);
}

void drawTree(int ax, int ay, float l, float lastAnkle, int i) {
  if(i == depth) return;
  if(i < 6) stroke(139, 69, 19);
  else stroke(34, 139, 34);
 
  
  if(depth - 2 * i < 1) strokeWeight(1);
  else strokeWeight((depth - 2 * i) * 2);
  
  float ankle;
  if(i == 0) 
    ankle = random(-maxAnkleTrunk, maxAnkleTrunk);
  else 
    ankle = lastAnkle + random(-maxAnkleDiff, maxAnkleDiff);
  
  int bx = (int)(ax + Math.sin(ankle) * l);
  int by = (int)(ay - Math.cos(ankle) * l);
  
  line(ax, ay, bx, by);
  
  int b1x = bx;
  int b1y = by;
  int b2x = bx;
  int b2y = by;
  int b3x = bx;
  int b3y = by;
  
  drawTree(b1x, b1y, l*0.8, ankle, i+1);
  drawTree(b2x, b2y, l*0.8, ankle, i+1);
  drawTree(b3x, b3y, l*0.8, ankle, i+1);
}


