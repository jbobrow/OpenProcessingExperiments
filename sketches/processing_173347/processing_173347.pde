
void setup() {
  size(600, 600);
  background(255);
  drawTree(width/2, height, -90, 9);
}

void draw() {
  if (mousePressed){
    background(255);
    drawTree(width/2, height, -90, 9);
  }
}

void drawTree(float x1, float y1, float angle, float depth) {
  if (depth ==0) return;
  float x2 = x1 + cos(radians(angle)) * depth * 10;
  float y2 = y1 + sin(radians(angle)) * depth * 10;
  strokeWeight(depth*4);
  line(x1, y1, x2, y2);
  if (random(0, 3)>1) {
    drawTree(x2, y2, angle-random(10, 25), depth-1);
  }
  if (random(0, 3)>1) {
    drawTree(x2, y2,angle+ random(10, 25), depth-1);
  }
}
