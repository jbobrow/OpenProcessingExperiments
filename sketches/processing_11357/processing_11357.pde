
void setup() {
  size(500, 500);
  smooth();
  colorMode(RGB, 256);
  background(74, 203, 200);//水色
  noLoop();
}

void draw() {
//波
  drawWave(250, 250);
  drawWave(40, 350);
  drawWave(460, 150);
}

//波
void drawWave(int x, int y) {
  noStroke();
  fill(255, 255, 255, 100);//白
  triangle(x - 50, y - 80, x + 50, y - 80, x , y);
  triangle(x - 90, y - 100, x + 90, y - 100, x, y + 35);
  triangle(x - 130, y - 120, x + 130, y - 120, x, y + 70);
  triangle(x - 170, y - 140, x + 170, y - 140, x, y + 105);
  triangle(x - 210, y - 160, x + 210, y - 160, x, y + 140);
}

