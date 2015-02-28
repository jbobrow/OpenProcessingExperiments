
Rect[] myRect = new Rect[6];
float posX = 0;
float posY = 0;

void setup() {
  size(300, 300);
  for (int i=0; i< myRect.length; i++) {
    myRect[i] = new Rect(posX, posY, 100, 10);
    posX = posX+50;
    posY = posY+50;
  }
}

void draw() {
  background(255);
  for (int i=0; i< myRect.length; i++) {
    myRect[i].move();
    myRect[i].display();
  }
}

class Rect {
  color c = color(0);
  float posX = 0;
  float posY = 100;
  float speed = 4.5;
  float xLength = 100;
  float yLength = 10;

  Rect(float tempPosX, float tempPosY, float tempXLength, float tempYLength) {
    posX = tempPosX;
    posY = tempPosY;
    xLength = tempXLength;
    yLength = tempYLength;
  }

  void display() {
    fill(c);
    rect(posX, posY, yLength, xLength);
    stroke(90, 90, 90);
    if (posX > width/2) {
      c = color(255);
    }
    else {
      c = color(0);
    }
  }

  void move() {
    posX = posX + speed;
    posY = posY+1;
    if (posX > width) {
      posX = 0;
    }
    if (posY > height) {
      posY = 0;
    }
  }
}



