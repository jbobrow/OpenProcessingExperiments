
//PONG

/* TO DO AT HOME
 
 -Print Score in Window
 -Change angle of ball??? */

//Header -- Variables
PVector ballPos = new PVector (0, 0);
PVector ballVel = new PVector (5, 2);

int padDimX = 20;
int padDimY = 80;
PVector paddleDim = new PVector (padDimX, padDimY);

int p1x;
int p2x;

int p1y;
int p2y;

boolean p1u, p1d, p2u, p2d;

int ballSize = 20;
int paddleSpeed = 10;

int lScore;
int rScore;

PFont fontVar;

//float[] fillVal = new float [3];

//int[]lShake = new int [4];
//int[]rShake = new int [4];

void setup() {
  size(600, 600);
  
  fill(255);

  //Initialize Score
  lScore = 0;
  rScore = 0;

  fontVar = loadFont("PongFont.vlw");
  textFont(fontVar, 42);


  //Paddle Start Position
  p1x = 15;
  p2x = width-15;
  p1y = height/2;
  p2y = height/2;

  //Ball Start Position
  ballPos.x = width/2;
  ballPos.y = height/2;

  rectMode(CENTER); //Rects drawn from center, not top-left corner

//  //R value
//  fillVal[0] = (random (0, 255));
//  //G value
//  fillVal[1] = (random (0, 255));
//  //B value
//  fillVal[2] = (random (0, 255));

  //  //Left paddle Shake
  //  lShake[0] = p1x - 5;
  //  lShake[1] = p1x + 4;
  //  lShake[2] = p1x - 3;
  //  lShake[3] = p1x + 2;
  //  
  //  //Right paddle shake
  //  rShake[0] = p2x + 5;
  //  rShake[1] = p2x - 4;
  //  rShake[2] = p2x + 3;
  //  rShake[3] = p2x - 2;
}

void draw() {
  background (0); 
  noStroke();

  //Score
  text(lScore, 50, 50);
  text(rScore, width-60, 50);

  //Ball & Paddle Movement
  movementLogic();
  collisionLogic();

  //Draw Ball
  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);

  //Draw Paddles
  rect(p1x, p1y, paddleDim.x, paddleDim.y);           //Left/P1
  rect(p2x, p2y, paddleDim.x, paddleDim.y);     //Right/P2

  //Score
  scoreKeeper();
}

void keyPressed() {
  //P1 Movement
  if (key == 'w') {
    p1d = false;
    p1u = true;
  }
  if (key == 's') {
    p1u = false;
    p1d = true;
  }

  //P2 Movement
  //THX Processing Documentation!
  if (key == CODED) {
    if (keyCode == UP) {
      p2d = false;
      p2u = true;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      p2u = false;
      p2d = true;
    }
  }
}

void keyReleased() {
  //P1 Stop Movement
  if (key == 'w') {
    p1u = false;
  }
  if (key == 's') {
    p1d = false;
  }

  //P2 Stop Movement
  //THX Processing Documentation!
  if (key == CODED) {
    if (keyCode == UP) {
      p2u = false;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      p2d = false;
    }
  }
}

void movementLogic() {
  //Draw Ball
  ballPos.x += ballVel.x;
  ballPos.y += ballVel.y;

  //P1
  if (p1u) p1y -= paddleSpeed;
  if (p1d) p1y += paddleSpeed;
  //P2
  if (p2u) p2y -= paddleSpeed;
  if (p2d) p2y += paddleSpeed;
  //if (p1u) ==> true... if (!p1u) ==> false
}

void collisionLogic() {
  //Left Paddle
  if ((ballPos.x - ballSize/2 <= p1x+(paddleDim.x/2))) {
    if ((ballPos.y >= p1y-(paddleDim.y/2)) && (ballPos.y <= p1y+(paddleDim.y/2))) {
      ballPos.x = 1 + ballSize/2 + (p1x+(paddleDim.x/2));
      ballVel.x  *= -1;
      randomColor(1);
    }
  }
  //Right Paddle
  if (ballPos.x + ballSize/2 >= p2x-(paddleDim.x/2)) {
    if ((ballPos.y >= p2y-(paddleDim.y/2)) && (ballPos.y <= p2y+(paddleDim.y/2))) {
      ballPos.x = (p2x-(paddleDim.x/2)) - ballSize/2 -1;
      ballVel.x *= -1;
      randomColor(1);
    }
  }
  //Paddle Y Walls
  //Left
  if (p1y < (padDimY/2)+5) {
    p1y = (padDimY/2)+5;
  }
  if (p1y > width-((padDimY/2)+5)) {
    p1y = width-((padDimY/2)+5);
  }
  //Right
  if (p2y < (padDimY/2)+5) {
    p2y = (padDimY/2)+5;
  }
  if (p2y > width-((padDimY/2)+5)) {
    p2y = width-((padDimY/2)+5);
  }
  //Ball Top Wall
  if (ballPos.y - ballSize/2 <= 0) {
    ballVel.y *= -1;
  }
  //Ball Bottom Wall
  if (ballPos.y + ballSize/2 >= height) {
    ballVel.y *= -1;
  }
}

void scoreKeeper() {
  if (ballPos.x <= 0) {
    rScore = rScore + 1;
    ballPos.x = width/2;
    ballPos.y = height/2;
    ballVel.x *= -1;
  }
  if (ballPos.x >= height) {
    lScore = lScore +1;
    ballPos.x = width/2;
    ballPos.y = height/2;
    ballVel.x *= -1;
  }
  print(" --- Player 1: " + lScore + ", Player 2: " + rScore + " ---");
}

void randomColor (int randCol) {
  fill((random (0, 255)), (random (0, 255)), (random (0, 255)));
}



