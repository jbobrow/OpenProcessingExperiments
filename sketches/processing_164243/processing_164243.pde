
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/163442*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PVector ballPos = new PVector(0, 0);
PVector ballVel = new PVector(4, 2);
PVector paddleDim = new PVector(10, 80);


int p1x;
int p2x;

int p1y;
int p2y;

boolean p1u, p1d, p2u, p2d;


int lScore;
int rScore;

int paddleSpeed = 15;
int ballSize = 20;

void setup() {
  size(600, 600);

  //Initialize Score
  lScore = 0;
  rScore = 0;

  p1x = 15;
  p2x = width-15;

  p1y = height/2;
  p2y = height/2;

  ballPos.x = width/2;
  ballPos.y = height/2;

  rectMode(CENTER);
}


void draw() {
  background(0);

  movementLogic();
  collisionLogic();

  //draw ball
  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);

  //draw paddles
  rect(15, p1y, paddleDim.x, paddleDim.y);
  rect(width-15, p2y, paddleDim.x, paddleDim.y);
}

void keyPressed() {
  //P1 Paddle movement
  if (key == 'w') {
    p1d= false;
    p1u = true;
  }

  if (key == 's') {
    p1u = false;
    p1d = true;
  }

  //P2 Paddle Movement
  // THX processing documentation

  if (key == CODED) {
    if (keyCode == UP) {
      p2d= false;
      p2u= true;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      p2u= false;
      p2d= true;
    }
  }
}


void keyReleased() {
  //P1 Paddle movement
  if (key == 'w') {
    p1u= false;
  }

  if (key == 's') {
    p1d = false;
  }

  //P2 Paddle Movement
  // THX processing documentation

  if (key == CODED) {
    if (keyCode == UP) {
      p2u= false;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      p2d= false;
    }
  }
}

void movementLogic() {
  ballPos.x += ballVel.x;
  ballPos.y += ballVel.y;

  if (p1u) p1y -= paddleSpeed;
  if (p1d) p1y += paddleSpeed;
  if (p2u) p2y -= paddleSpeed;
  if (p2d) p2y += paddleSpeed;
}

void collisionLogic() {

  if (ballPos.x >= width-ballSize/2)
  {
    ballPos.x = width-ballSize/2;
    ballVel.x *= -1;
  }

  if (ballPos.x <= ballSize/2)
  {
    ballPos.x = ballSize/2;
    ballVel.x *= -1;
  }

  if (ballPos.y > height-ballSize/2)
  {
    ballPos.y = height-ballSize/2;
    ballVel.y *= -1;
  }

  if (ballPos.y < ballSize/2)
  {
    ballPos.y = ballSize/2;
    ballVel.y *= -1;
  }

  //Left Paddle
  if (ballPos.x - ballSize/2 <= p1x+(paddleDim.x * .5 )
    && ballPos.y > p1y - (paddleDim.y * .5) - 8
    && ballPos.y < p1y + (paddleDim.y * .5) + 8) 
  {
    ballPos.x = 1 + ballSize/2 + (p1x+(paddleDim.x * .5 ));
    ballVel.x *= -1;
    
    fill(random(255));

  } 
  else {
    ballVel.x *= 1;
  }

  //Right Paddle
  if (ballPos.x + ballSize/2 >= p2x-(paddleDim.x * .5 )
    && ballPos.y > p2y - (paddleDim.y * .5) - 8
    && ballPos.y < p2y + (paddleDim.y * .5) + 8) 
  {
    ballPos.x = (p2x-(paddleDim.x * .5 ))- ballSize/2 - 1;
    ballVel.x *= -1;
    
    fill(random(255));
  } 
  else 
  {
    ballVel.x *= 1;
  }
}



