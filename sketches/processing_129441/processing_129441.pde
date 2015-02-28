
ThingyMoving square;


void setup() {
  frameRate(30);
  size(400, 400);
  fill(255);
  square = new ThingyMoving(0, 0);
}

void draw() {
  background(0);
  square.drawSquare(mouseX, mouseY);
}


class ThingyMoving {

  int initPX = 0;
  int initPY= 0;
  ThingyMoving(int initialPosX, int initialPosY) {
    initPX = initialPosX;
    initPY = initialPosY;
  }
  void drawSquare(int x, int y) {
    rect(x, y, 50, 50);
  }
}


void mouseDragged() {
  if (mousePressed == true) {
  }
}

