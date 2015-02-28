
int xPos1;
int speed1 = 2;
int xDir1 = 1;
int xPos2;
int speed2 = 1;
int xDir2 = -1;
int score = 0;
boolean gameOver = false;
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size (400, 400);
  smooth();
  fill(255, 255, 255);
  xPos1 = 25;
  xPos2 = width - 25;
  textSize(15);
  imageMode(CENTER);
  textAlign(CENTER);
  img = loadImage("player_right.png");
  img2 = loadImage("player_left.png");
  img3 = loadImage("hadouken.jpg");
  img4 = loadImage("hadouken2.jpg");
}

void draw() {
  if (!gameOver) {
    background(0);
    image(img, width/2, height/2 - 15, 50, 50);
    if (keyCode == LEFT) {
      background(0);
      image(img2, width/2, height/2 - 15, 50, 50);
      xPos1 = xPos1 + (speed1 * xDir1);
      xPos2 = xPos2 + (speed2 * xDir2);
      if (xPos1 >= width/2 - 30) {
        xDir1 *= -1;
        speed1++;
        if (speed1 == 8) { //speed control
          speed1 /= 4;
        }
        score++;
        if (xPos2 <= width/2 + 30) { 
          gameOver = true;
        }
      }
    } else if (keyCode == RIGHT) {
      background(0);
      image(img, width/2, height/2 - 15, 50, 50);
      xPos1 = xPos1 + (speed1 * xDir1);
      xPos2 = xPos2 + (speed2 * xDir2);
      if (xPos2 <= width/2 + 30) {
        xDir2 *= -1;
        speed2++;
        if (speed2 == 8) { //speed control
          speed2 /= 4;
        }
        score++;
      }
      if (xPos1 >= width/2 - 30) {
        gameOver = true;
      }
    }
    if (gameOver) {
      renderGameOver();
    }
    image(img3, xPos1, height/2 - 20, 30, 30);
    if (xDir1 < 0) { //loads flipped image.
      image(img4, xPos1, height/2 - 20, 30, 30);
    }
    if (xPos1 < 25) {
      xDir1 *= -1;
    }
    image(img4, xPos2, height/2 - 20, 30, 30);
    if (xDir2 > 0) { //loads flipped image.
      image(img3, xPos2, height/2 - 20, 30, 30);
    }
    if (xPos2 > width - 25) {
      xDir2 *= -1;
    }

    text("score: " + score, 30, 15);
  }
}
void renderGameOver() {
  background(0);
  text("Game Over!", width/2, height/2 + 25);
}


