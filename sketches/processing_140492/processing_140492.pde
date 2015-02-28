
void setup() {
  size(600, 400);
  smooth();
  strokeWeight(0.1);
  background(255);
  colorMode(HSB, 20);
  noLoop();
}

void draw() {
  background(2, 14, 7);

  stroke(1, 12, 19);
  grid(0, 0, 3, 100);
  grid(10, 10, 3, 100);


  stroke(2, 9, 16);
  grid(50, 20, 8, 100);


  stroke(5, 16, 9);
  int yPos = 20;
  while (yPos < height) {
    row(yPos, 20, 3);
    yPos+=100;
  }
  save("nameOfTartan.png");
}


void grid(int xPos, int yPos, int strokeHeight, int d) {
  for (int x=xPos;x<width;x+=d) {
    for (int y=yPos;y<width;y+=d) {
      col(x, strokeHeight, 3);
      row(y, strokeHeight, 3);
    }
  }
}
void row(int yPos, int strokeHeight, int d) {
  for (int x=0-strokeHeight;x<width;x+=d) {
    line(x, yPos, x+strokeHeight, yPos+strokeHeight);
  }
}
void col(int xPos, int strokeHeight, int d) {
  for (int y=0-strokeHeight;y<height;y+=d) {
    line(xPos, y, xPos+strokeHeight, y+strokeHeight);
  }
}
