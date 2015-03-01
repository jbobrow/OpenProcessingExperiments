
void setup() {
  size(600, 400);
  smooth();
  strokeWeight(0.1);
  background(255);
  colorMode(HSB, 20);
  noLoop();
}

void draw() {
  background(8, 26, 165);

  stroke(232, 49, 194);
  grid(0, 0, 3, 100);
  grid(10, 10, 3, 100);


  stroke(79, 240, 163);
  grid(50, 50, 8, 100);


  stroke(236, 128, 159);
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
