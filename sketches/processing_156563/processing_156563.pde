
float posX = 0;
float posY = 0;
int diameter2 = 30;
PImage smile;
PImage cry;


void setup() {

  size (800, 600);
  smile = loadImage("1.png");
  cry = loadImage("2.png");

  imageMode(CENTER);
}

void draw () {

  background(255);

  drawBall();

  if (dist(posX, posY, width/2, height/2) < smile.width/2) {
    drawCry();
  } else {
    drawSmile();
  }
}

void drawSmile() {

  image(smile, width/2, height/2);
}

void drawCry() {
  image(cry, width/2, height/2);
}

void drawBall() {
  if (keyPressed) {
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        posY -= 5;
        break;
      case DOWN:
        posY += 5;
        break;
      case LEFT:
        posX -= 5;
        break;
      case RIGHT:
        posX += 5;
        break;
      }
    }
  }

  fill(255, 0, 0);
  ellipse(posX, posY, diameter2, diameter2);
}



