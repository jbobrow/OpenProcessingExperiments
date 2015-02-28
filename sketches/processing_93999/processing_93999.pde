
//player's y-coordinates
int pY1;
int pY2;
//ball's coordinates
int bX;
int bY;
//player controls
boolean up;
boolean down;
boolean w;
boolean s;
int score1;
int score2;
//constant variables
int pX1;
int pX2;
int paddleWidth;
int paddleHeight1;
int paddleHeight2;
//changing variables
int pSpeed;
int bSize;
int moveX;
int moveY;
boolean win;

void setup () {
  size (1000, 800);
  score1 = 0;
  score2 = 0;
  pX1 = 20;
  pX2 = width - 30;
  paddleWidth = 10;
  paddleHeight1 = 200;
  paddleHeight2 = 200;
  pSpeed = 5;
  bSize = 20;
  moveX = 5;
  moveY = 5;
  pY1 = 400;
  pY2 = 400;
  bX = 500;
  bY = 400;
  up = false;
  down= false;
  w = false;
  s = false;
  win = false;
}

void draw() {

  if (w == true) {
    pY1 -= pSpeed;
  }
  if (s == true) {
    pY1 += pSpeed;
  }
  if (up == true) {
    pY2 -= pSpeed;
  }
  if (down == true) {
    pY2 += pSpeed;
  }
  if (win == false) {

    background(0);
    text(score1, 30, 50);
    text(score2, width-37, 50);
    rect(pX1, pY1, paddleWidth, paddleHeight1);
    rect(pX2, pY2, paddleWidth, paddleHeight2); 
    ellipse(bX, bY, bSize, bSize);
    bX += moveX;
    bY += moveY;

    if (pY1 < 0) {
      pY1 = 0;
    }
    if (pY1 + paddleHeight1 > 1000) {
      pY1 = height - paddleHeight1;
    }
    if (pY2 < 0) {
      pY2 = 0;
    }
    if (pY2 + paddleHeight2 > 1000) {
      pY2 = height - paddleHeight2;
    }
    if (bY < 10 || bY > 790) {
      moveY *= -1;
      
    }

    if (bX > pX1 && bX < pX1 + paddleWidth && bY > pY1 && bY < pY1 + paddleHeight1)
    {
      moveX *= -1;
      paddleHeight1 -= 10;
      background(((int)random(0,255)),((int)random(0,255)),((int)random(0,255)));
    }

    if (bX > pX2 && bX < pX2 + paddleWidth && bY > pY2 && bY < pY2 + paddleHeight2)
    {
      moveX *= -1;
      paddleHeight2 -= 10;
      background(((int)random(0,255)),((int)random(0,255)),((int)random(0,255)));
    }
    if (bX < 0) {
      score2 = score2 + 1;
      bX = 500;
      bY = 400;
      moveX *= -1;
    }
    if (bX > 1000) {
      score1 = score1 + 1;
      bX = 500;
      bY = 400;
      moveX *= -1;
    }

    if (score1 > 3 || score2 > 3) {
      win = true;
      background (0);
      text ("Game Over  " + score1 + " : " + score2, 400, 400);
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == DOWN) {
    down = true;
  }
  if (keyCode == 'W') {
    w = true;
  }
  if (keyCode == 'S') {
    s = true;
  }
}

void keyReleased() {
  if (keyCode == UP)
  {
    up = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
  }
  if (keyCode == 'W')
  {
    w = false;
  }
  if (keyCode == 'S')
  {
    s = false;
  }
}
