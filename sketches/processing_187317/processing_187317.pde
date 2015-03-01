
void setup() {
  size(640, 360); 
  background(0); 
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
}

float counter = 0;

void draw() {
  int gridSize = 40;
  
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      rainbow(x, y);
    }
  }
  counter += .01;
}

void rainbow(int x, int y) {
  float cx = cos(counter+x)*255;
  float cy = cos(counter+y)*255;
  
  fill(255, cx, cy);
  ellipse(x, y, 40, 40);
  fill(cy, 255, cx);
  ellipse(x, y, 30, 30);
  fill(cx, cy, 255);
  ellipse(x, y, 20, 20);
  fill(0);
  ellipse(x, y, 10, 10);
  fill(0);
  rect(x, y+10, 40, 20);
}
