
int startY = 0;

void setup() {
  size(400, 400);
  frameRate(10);
}

void draw() {
  
  background(255);
  
  for (int y = startY; y < 50+startY; y += 10) {
    stroke(0);
    line(0, y, width, y);
    
  }
  startY += 10;
}


