
float xPos1;
float speed1 = 1;
float xDir1 = 1;
float xPos2;
float speed2 = 2;
float xDir2 = -1;
int score= 0;
boolean gameOver = false;
PImage img;
PImage img2;

void setup() {
  size (400, 400);
  smooth();
  xPos1 = 15;
  xPos2 = width - 15;
  fill(255, 255, 255);
  textSize(15);
  img = loadImage("player_right.png");
  img2 = loadImage("player_left.png");
}

void draw() {
  background(0);
  image(img, width/2 - 20, height/2 - 15, 50, 50);
  if (key == CODED) {
    background(0);
    if (keyCode == LEFT) {
      image(img2, width/2 - 20, height/2 - 15, 50, 50);
    } else if (keyCode == RIGHT) {
      image(img, width/2 - 20, height/2 - 15, 50, 50);
    }
  }

  ellipse(xPos1, height/2, 30, 30);
  xPos1 = xPos1 + (speed1 * xDir1);
  if (xPos1 > width/2 - 40 || xPos1 < 15) {
    xDir1 *= -1;
  }
  ellipse(xPos2, height/2, 30, 30);
  xPos2 = xPos2 + (speed2 * xDir2);
  if (xPos2 < width/2 + 40 || xPos2 > width - 15) {
    xDir2 *= -1;
  }
  text("score: " + score, 15, 15);
}

