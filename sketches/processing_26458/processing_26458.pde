
int endY = 0;

void setup() {
  size(200, 200);
  frameRate(5);
  
}

void draw() {
  background(0);
  for (int y = 0; y < endY; y += 10) {
    stroke(255);
    line(0, y, width, y);
  }

  endY += 10; 
}

