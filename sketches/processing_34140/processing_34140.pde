
void setup() {
  size (50*8+40, 50*8+40);
  background (0);
  noStroke();
  smooth();
}

void draw() {
  for (int x=20; x<50*8; x+=100) {
    for (int y=20; y<50*8; y+=100) {
      fill (255);
      rect (x, y, 50, 50);
      rect (x+50, y+50, 50, 50);
    }
    strokeWeight (3);
    stroke (255);
    noFill();
    rect(20, 20, 50*8, 50*8);
  }
}    
