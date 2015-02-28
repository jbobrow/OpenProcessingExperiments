
float treeXPosition = 600.0;
int launchPosition = -1;
int altitude = 0;
int explosionPosition = -1;
int pig1Position = (int) random (100, 700);
int pig2Position = (int) random (100, 700);
int birdAltitude = (int)random(25, 400);
int poop = birdAltitude;
int birdPosition = -1;
int birdPositionMax = 800;
int score = 0;
int cPosition = 0;
int poopPosition = -1;
int gameOver = 0;
int sPosition = 900;
int sRandom = (int) random (1, 10);
int wrPos = 900;
int wlPos = -100;
int explosionLength = 10; // number frame the explosion will last
int explosionLeft;
int wlyPos = 550;
int wryPos = 550;

void keyPressed() {
  if (key == ' ') {
    explosionLeft = explosionLength;
    explosionPosition = cPosition;
    if ((explosionPosition >= (pig1Position - 50)) && (explosionPosition <= (pig1Position + 50))) {
      pig1Position = 900;
    }
    if ((explosionPosition >= (pig2Position - 50)) && (explosionPosition <= (pig2Position + 50))) {
      pig2Position = 900;
    }
    if (explosionPosition + 100 >= sPosition) {
      sPosition = (100000);
    }
    if (explosionPosition + 50 >= wrPos - 50) {
      wrPos = 100000;
    } 
    if (explosionPosition - 50 <= wlPos + 50) {
      wlPos = -100000;
    }
  }
    else if ((key == 'f') && (launchPosition < 0)) {
      launchPosition = cPosition;
      altitude = 555;
      rect (mouseX, 565, 15, 15);
    } 
    else {
      explosionPosition = -1;
    }
  }

  void drawTree(float xPosition)
  {
    fill (0, 0, 0);
    rect (xPosition, 475, 20, 125);
    fill (0, 255, 0);
    ellipse (xPosition + 10, 500, 100, 100);
  }

  void setup()
  {
    noCursor ();
    size (800, 600);
    background(0, 0, 300);
    drawTree(100);
    fill (0, 255, 0);
    ellipse (400, 450, 100, 100);
    fill (0, 0, 0);
    rect (390, 500, 20, 200);
    fill (255, 255, 255);
    ellipse (200, 200, 100, 50);
    ellipse (250, 200, 100, 50);
    ellipse (225, 175, 75, 35);
    fill (0, 255, 0);
    fill (0, 0, 0);
    rect (treeXPosition, 475, 20, 125);
    fill (0, 255, 0);
    ellipse (treeXPosition + 10, 500, 100, 100);
    rect (0, 595, 800, 15);
    drawPiggy (pig1Position);
    drawPiggy (pig2Position);
    fill (249, 250, 8);
    ellipse (775, 0, 125, 125);
    drawCloud (600, 200, 90, 60);
    frameRate (60);
  }

  void draw () {
    if (explosionPosition != -1) {
      //return;
    }
    creeper(cPosition);
    if (key == 'd' && keyPressed) {
      if (cPosition < pig1Position && cPosition < pig2Position)
      {
        cPosition = cPosition + 5;
      }
    }
    if (key == 'a' && keyPressed)
    {
      cPosition = cPosition - 5;
    }
    if ((poopPosition < 0) && (cPosition <= birdPosition)) {
      poopPosition = birdPosition;
      poop = birdAltitude;
    }
    if ((int)score == sRandom)
    {
      sPosition = sPosition - 10;
      drawSteve(sPosition);
    }
    if (sPosition <= cPosition) {

      cPosition = 10000;
      textSize (40);
      gameOver = gameOver + 1;
    }

    if (explosionLeft > 0) {
      drawExplosion();
      explosionLeft--;
    }

    if (launchPosition >= 0) {
      float r = random (225);
      float g = random (225);
      float b = random (225);
      fill (r, g, b);
      ellipse (launchPosition, altitude, 20, 20);
      altitude = altitude - 5;
      if (altitude < 0) {
        launchPosition = -1;
      }
    }
    if (birdPosition >= birdPositionMax) {
      birdPosition = 0;
      birdAltitude= (int)random(20, 80);
      birdAltitude= birdAltitude*5;
      if (poop > 600) {
        poopPosition = -1;
      }
    }

    fill (birdPosition/4, 0, 0);
    ellipse (birdPosition, birdAltitude, 50, 50);
    fill (225, 225, 225);
    rect (birdPosition + 10, birdAltitude - 10, 8, 8);
    rect (birdPosition - 10, birdAltitude - 10, 8, 8);
    birdPosition = birdPosition + 5;
    if (launchPosition >= ((birdPosition - 50)) && ((launchPosition <= (birdPosition + 50)) && ((altitude == (birdAltitude)))))
    {
      fill (255, 0, 0);
      ellipse (birdPosition, birdAltitude, 100, 100);
      birdAltitude = birdAltitude -50;
      birdPosition = 0;
      altitude = -40;
      score = score + 1;
    }


    if (score == 10) {
      fill (0);
      textSize (50);
      text("SSSSSssss... good jawb!!!", 100, 300);
      text("To continue hit another bird", 100, 350);
    }
    if (poopPosition >= 0) {

      ellipse (poopPosition, poop, 20, 20);
      poop = poop + 3;
    }
    if (((poopPosition <= (cPosition + 10)) && (poopPosition >= (cPosition - 1)) && (poop >= 540)) && (poop <= 590)) {
      gameOver = gameOver + 1;
      cPosition = 700000;
    }
    if (gameOver >= 1) {
      textSize (50);
      text ("Game Over", 200, 300);
    }
    if ((key == 'i')&& keyPressed )
    {
      textSize (30);
      text ("A to move Left", 500, 35);
      text ("D to move Right", 500, 70);
      text ("F to fire missles", 500, 105);
      text ("Space to blow up", 500, 140);
    }
    if ((int) sRandom == score) {
      wlPos = wlPos + 1;
      wrPos = wrPos - 1;
      drawLeftWolf (wlPos, wlyPos);
      drawWolf (wrPos, wryPos);
      if (wlPos > cPosition)
      {
        gameOver = gameOver + 1;
        cPosition = -10000;
        wlPos = wlPos;
        if (wlyPos > 500) {
          wlyPos = wlyPos - 3;
          wlPos = wlPos;
        }
        else {
          wlyPos = 550;
        }
      }
      if (wrPos < cPosition) 
      {
        gameOver = gameOver + 1;
        cPosition = 10000;
        wrPos = wrPos;

        if (wryPos > 500) {
          wryPos = wryPos - 3;
        }
        else 
        {
          wryPos = 550;
        }
      }
    if (wrPos > 90000) {
      wlPos = wlPos + 10;
    }
    if (wlPos < -90000) {
      wrPos = wrPos - 10;
  }
    }
    fill (255, 0, 0);
    textSize (14);
    text ("Press 'i' for instructions", 15, 80);
    textSize (30);
    text ("Birds Hit:" + score, 15, 50);
  }

  void creeper (float cPosition) {
    setup ();
    fill(0, 255, 0);
    rect (cPosition, 550, 12, 40);
    rect (cPosition - 3, 587, 8, 8);
    rect (cPosition + 10, 587, 8, 8);
    rect (cPosition - 2, 540, 20, 20);
    fill (0, 0, 0);
    rect (cPosition + 3, 545, 3, 5);
    rect (cPosition + 10, 545, 3, 5);
    rect (cPosition + 5, 555, 6, 3);
  }
  void drawCloud(float xPosition, float yPosition, float cloudwidth, float cloudheight)
  {
    fill (255, 255, 255);
    ellipse (xPosition, yPosition, cloudwidth, cloudheight);
    ellipse (xPosition + 25, yPosition, cloudwidth - 5, cloudheight - 5);
  }
  void drawPiggy (float xPos)
  {
    if (xPos >= 0) {
      fill (239, 141, 240);
      rect (xPos, 575, 30, 15);
      rect (xPos + 1, 587, 5, 8);
      rect (xPos + 25, 587, 5, 8);
      rect (xPos + 28, 575, 10, 10);
      fill (0, 0, 0);
      rect (xPos + 33, 577, 3, 3);
      rect (xPos + 34, 581, 4, 2);
    }
  }
  void drawSteve (float sPosition)
  {
    fill (50, 249, 227);
    rect (sPosition, 530, 14, 40);
    fill (0, 0, 150);
    rect (sPosition, 570, 14, 20);
    fill (144, 78, 12);
    rect (sPosition - 25, 535, 5, 23);
    fill (0);
    rect (sPosition - 5, 590, 19, 7);
    rect (sPosition - 5, 516, 24, 4);
    fill (240, 171, 68);
    rect (sPosition - 25, 544, 5, 10);
    rect (sPosition - 5, 520, 24, 24);
    fill (0, 0, 250);
    rect (sPosition - 2, 526, 4, 4);
    fill (0);


    fill (255);
    rect (sPosition-5, 535, 10, 5);

    fill (50, 249, 227);
    rect (sPosition - 20, 544, 30, 10);
    fill (188, 183, 179);
    rect (sPosition - 25, 510, 5, 30);
    triangle(sPosition - 20, 510, sPosition - 25, 510, sPosition - 23, 505);
  }

  void drawExplosion()
  {
    fill (252, 98, 8);
    ellipse (explosionPosition, 570, 100, 100);
  }


  void drawWolf(float wrPos, float wryPos)
  {
    fill(152, 147, 153);
    rect(wrPos, wryPos + 20, 50, 20);
    rect(wrPos, wryPos + 18, 10, 23);
    rect(wrPos + 12, wryPos + 39, 6, 9);
    rect(wrPos + 38, wryPos + 39, 6, 9);
    rect(wrPos +50, wryPos + 20, 20, 6);
    rect (wrPos - 13, wryPos + 20, 13, 15);
    rect (wrPos-20, wryPos + 30, 20, 10);
    fill (0);
    rect (wrPos - 20, wryPos + 35, 10, 2);
    rect (wrPos - 11, wryPos + 23, 6, 1);
    fill (255);
    rect (wrPos - 10, wryPos + 24, 4, 5);
    fill(0);
    triangle(wrPos - 6, wryPos + 20, wrPos + 2, wryPos +20, wrPos - 2, wryPos + 15);
  }
  void drawLeftWolf(float wlPos, float wlyPos)
  {
    fill(152, 147, 153);
    rect(wlPos - 50, wlyPos + 20, 50, 20);
    rect(wlPos, wlyPos + 18, 10, 23);
    rect(wlPos - 12, wlyPos + 39, 6, 9);
    rect(wlPos - 38, wlyPos + 39, 6, 9);
    rect(wlPos- 70, wlyPos + 20, 20, 6);
    rect(wlPos + 10, wlyPos + 20, 13, 15);
    rect(wlPos + 10, wlyPos + 30, 20, 10);
    fill (0);
    rect(wlPos + 20, wlyPos + 35, 10, 2);
    rect(wlPos + 15, wlyPos + 23, 6, 1);
    fill(225);
    rect (wlPos + 16, wlyPos + 24, 4, 5);
    fill (0);
    triangle(wlPos + 8, wlyPos + 20, wlPos + 16, wlyPos + 20, wlPos + 10, wlyPos + 15);
  }
