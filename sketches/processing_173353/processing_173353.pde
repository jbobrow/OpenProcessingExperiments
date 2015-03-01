
float yoff = 0.0;
float mouseInteraction = 0;
void setup() {
  size(640, 360);
}

void draw() {
  background(134,67,0);
  mouseInteraction = (mouseX-pmouseX)*0.1;
  drawTree(width/2, height-80, -88, 10);
  fill(0,150,0);
  beginShape(); 
  float xoff = 0;

  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, 200, 300);
    vertex(x, y); 
    xoff += 0.05;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void drawTree(float x1, float y1, float angle, float depth) {
  if (depth ==0) return;
  float x2 
    = x1 + cos(radians(angle)) * depth * 5 + mouseInteraction;
  float y2 
    = y1 + sin(radians(angle)) * depth * 5;
  stroke(255, 255, 255);
  strokeWeight(depth/2);
  line(x1, y1, x2, y2);
  drawTree(x2, y2, angle-20, depth-1); 
  drawTree(x2, y2, angle+20, depth-1);
}

