
int i = 0;
float squareColor = 0;
int squareX = 0;
int squareY = 0;
int maxX = width;
int maxY = height;
void setup() {
  size(850, 670);
  maxX = width;
  maxY = height;
  while (maxX != squareX) {
    while (maxY != squareY) {
      squareColor = random(255);
      noStroke();
      fill(squareColor);
      rect(squareX, squareY, 10, 10);
      squareY = squareY + 10;
    }
    squareY = 0;
    squareX = squareX + 10;
  }
  squareX = 0;
}
void draw() {
}
void mousePressed() {
  maxX = width;
  maxY = height;
  while (maxX != squareX) {
    while (maxY != squareY) {
      squareColor = random(255);
      noStroke();
      fill(squareColor);
      rect(squareX, squareY, 10, 10);
      squareY = squareY + 10;
    }
    squareY = 0;
    squareX = squareX + 10;
  }
  squareX = 0;
}
void keyPressed() {
  maxX = width;
  maxY = height;
  while (maxX != squareX) {
    while (maxY != squareY) {
      squareColor = random(255);
      noStroke();
      fill(squareColor);
      rect(squareX, squareY, 10, 10);
      squareY = squareY + 10;
    }
    squareY = 0;
    squareX = squareX + 10;
  }
  squareX = 0;
}



