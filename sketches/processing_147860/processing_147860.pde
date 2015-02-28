
void setup() {
  size (600, 600);
  smooth();
  background(0);
  noLoop();
}

void draw() {
  for (int i=5; i<width; i=i+30) {
    for (int j=10; j<height; j=j+60) {
      fill(random(255));
      rect(i, j, 20, 40, 5);
    }
  }
}

void keyPressed() {
  background(0);
  redraw();
} 

