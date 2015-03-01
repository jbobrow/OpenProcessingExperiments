
void setup() {
  size(1000, 1000);
  background(255);
}


void draw() {
  
  line(0, 500, 1000, 500);
  fill(255,170,60);
  rect(300, 400, 400, 400);
  rect(500, 200, 200, 500);

  int x=500;
  int y=300;

  while (y< height) {
    drawWindow(x, y);
    drawWindow(x+100, y);
    y+=80;
  }
}

void drawWindow(int x, int y) {
  rect(x, y, 55, 55);
  line(x+25, y, x+25, y+55);
  line(x, y+25, x+55, y+25);
}

