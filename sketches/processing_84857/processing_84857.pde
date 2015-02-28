
int gridSpacing = 10;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  fill(255, 0, 0);
  line(mouseX, mouseY, 0, 0);
  translate(1, 0);
  stroke(20);
  rect(10, 10, 50, 50);
  
  for (int i = 0; i < width; i += gridSpacing) {
    for (int j = 0; j < height; j += gridSpacing) {
      line(i, j, i, height);
      line(i, j, width, j);
    }
  }
}


