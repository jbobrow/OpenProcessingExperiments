
int endY;
void setup() {
  size(500, 500);
  frameRate(10);
  endY = 0;
}
void draw() {
  background(255);
  for (int y = 0; y < endY; y+=10) {
    stroke(0);
    line(0, y+30, width, y);
    line(0, y, width, y+30);
    line(0, y+60, width, y);
    line(0, y, width, y+60);
    line(0, y+90, width, y);
    line(0, y, width, y+90);
    line(0, y+120, width, y);
    line(0, y, width, y+120);
    line(0, y+150, width, y);
    line(0, y, width, y+150);
  }
  endY += 10;
  if (endY > height) {
    endY = 0;
  }
}

