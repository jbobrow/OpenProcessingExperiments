

PFont scoreFont;
PFont smallFont;
PFont finePrint;

PVector ballPos = new PVector(0, 0);
PVector ballVel = new PVector(3, 1);
PVector paddleDim = new PVector(15, 90);
PVector posInit = new PVector (0, 0);
PVector velInit = new PVector (0, 0);

int level = 1;


float paddleSpeed = 15;
float p1x;
float p2x;
float p1y;
float p2y;
float p1ySpeed;
float p1xSpeed;
float p2ySpeed;
float p2xSpeed;
float gravity = 0.25;
float friction = 0.7;

int p1Score;
int p2Score;
int ballSize = 20;
int ballOut;

boolean p1u, p1d, p1r, p1l, p2u, p2d, p2r, p2l;

void setup() {
  size(1000, 600);
  fill(255);
  frameRate(40);
  noStroke();
  
  //Initialize fonts
  smallFont = loadFont("muro24.vlw");
  scoreFont = loadFont("muro48.vlw");
  finePrint = loadFont("help.vlw");
  
  //Initialize Ball
  posInit.x = width/2;
  posInit.y = height/2;

  //Initialize Score
  p1Score = 0;
  p2Score = 0;

  //Paddle Initial Pos  
  p1x = 15;
  p2x = width-15;
  p1y = height/2;
  p2y =height/2;

  //Center Ball
  ballPos.x = width/2;
  ballPos.y = height/2;
}


void draw() {
  background(0, 0, 0);
  rectMode(CENTER);

  //Referee
  ballOutP1(); 
  ballOutP2();
  rect((width/4) + paddleDim.x, height/2, 1, height);
  rect((width - (width/4)) - paddleDim.x, height/2, 1, height);

  //Score
  textFont(smallFont);
  text("score", width/2 - 25, 30);
  text("level  "+level, width/2 - 27, 90);

  textFont(scoreFont);
  text(p1Score, (width/2) - 62, 68);
  text(p2Score, (width/2) + 44, 68);
  
  //Level
  paddleDim.x = 15;
  paddleDim.y = 120 - (level*8);
  velInit.x = 3 * level;
  velInit.y = 1 * (level/3);
  paddleSpeed = 15 + (level*2);

  //Instructions 
  fill(190);
  textFont(finePrint);
  text("press keys 'h' and 'e' to increase or decrease difficulty", width/2 - 130, height - 10); 
  
  fill(255);
  
  //Engine
  boundaries();
  movementLogic();
  collisionLogic();

  //Draw Ball
  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);

  //Draw Paddles
  //(shorthand for false: (!p1u)
  rect(p1x, p1y, paddleDim.x, paddleDim.y, 4);
  rect(p2x, p2y, paddleDim.x, paddleDim.y, 4);
}

void keyPressed() {
  
  //Level
  if (key == 'h' && level <= 2) {
    level+= 1;
  }
  
  if (key == 'e' && level >= 2) {
    level-= 1;
  }
  
  //P1 Paddle Control
  if (key == 'w') {
    p1u = true;
    p1d = false;
  }
  if (key == 's') {
    p1d = true;
    p1u = false;
  }
  if (key == 'd') {
    p1r = true;
    p1l = false;
  }
  if (key == 'a') {
    p1l = true;
    p1r = false;
  }

  //P2 Paddle Control
  if (key == CODED) {
    if (keyCode == UP) {
      p2u = true;
      p2d = false;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      p2d = true;
      p2u = false;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      p2r = true;
      p2l = false;
    }
  }
  if (key == CODED && p2x >= width/4) {
    if (keyCode == LEFT) {
      p2l = true;
      p2r = false;
    }
  }
}

void keyReleased() {

  //Limit paddles to boundaries
  if (p1y + paddleDim.y == height || p2y + paddleDim.y == height) {
    p1d = false;
    p2d = false;
  }
  if (p1y - paddleDim.y == 0 || p2y - paddleDim.y == 0) {
    p1u = false;
    p2u = false;
  }

  //P1 Paddle Stop
  if (key == 'w') {
    p1u = false;
  }
  if (key == 's') {
    p1d = false;
  }
  if (key == 'a') {
    p1l = false;
  }
  if (key == 'd') {
    p1r = false;
  }

  //P2 Paddle Stop
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

  if (key == CODED) {
    if (keyCode == RIGHT) {
      p2r = false;
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      p2l = false;
    }
  }
}

void movementLogic() {
  ballPos.x += ballVel.x;
  ballPos.y += ballVel.y;
  ballVel.y += gravity;

  //Move P1 down
  if (p1d == true && p1y < height - paddleDim.y/2) {
    p1y+=paddleSpeed;
  }

  //Move P2 down
  if (p2d == true && p2y < height - paddleDim.y/2) {
    p2y+=paddleSpeed;
  }

  //Move P1 up
  if (p1u == true && p1y - (paddleDim.y/2) > 0) {
    p1y-=paddleSpeed;
  }
  //Move P2 up
  if (p2u == true && p2y - (paddleDim.y/2) >0) {
    p2y-=paddleSpeed;
  }

  //Move P1 forward (go right)
  if (p1r == true && p1x < width/4 ) {
    p1x+=paddleSpeed;
  }

  //Move P2 forward (go left)
  if (p2l == true && p2x > width-(width/4) ) {
    p2x-=paddleSpeed;
  }

  //Move P1 backwards (go left)
  if (p1l == true && p1x - paddleDim.x > 10) {
    p1x-=paddleSpeed;
  }

  //Move P2 backwards (go right)
  if (p2r == true && p2x + (paddleDim.x/2) < width - 10) {
    p2x+=paddleSpeed;
  }
}

void boundaries() {
  //Ball's
  if (ballPos.y >= height - (ballSize/2)) {
    ballPos.y = height - (ballSize/2) + 1;
    ballVel.y *= -1;
  }
  if (ballPos.y <= ballSize/2) {
    ballPos.y = (ballSize/2) + 1;
    ballVel.y *= -1;
  }
}

void collisionLogic() {

  //Left Paddle Front face
  if (ballPos.y >= p1y - (paddleDim.y/2) && ballPos.y <= p1y + (paddleDim.y/2)
    && ballPos.x - (ballSize/2) <= p1x + (paddleDim.x/2) && ballPos.x - (ballSize/2) > p1x - (paddleDim.x*2) ) {
    ballPos.x = p1x + (paddleDim.x/2) + (ballSize/2) + 1;
    ballVel.x*= -friction;

    //Apply paddle Speed to ball's movement
    if (p1d == true ) {
      ballVel.y += ((paddleSpeed/4) * (level/1.25));
    }
    if (p1u == true ) {
      ballVel.y -= ((paddleSpeed/4) * (level/1.25));
    }
    if (p1l == true ) {
      ballVel.x -= ((paddleSpeed/2) * (level/1.25));
    }
    if (p1r == true) {
      ballVel.x += ((paddleSpeed/2) * (level/1.25));
    }
  }

  //Right Paddle front face
  if (ballPos.y >= p2y - (paddleDim.y/2) && ballPos.y <= p2y + (paddleDim.y/2)
    && ballPos.x + (ballSize/2) >= p2x - (paddleDim.x/2) && ballPos.x + (ballSize/2) < p2x + (paddleDim.x*2) ) {
    ballPos.x =  p2x - (paddleDim.x/2) - (ballSize/2) - 1;
    ballVel.x*= -friction;

    //Apply paddle Speed to ball's movement
    if (p2d == true ) {
      ballVel.y += ((paddleSpeed/4) * (level/1.25));
    }
    if (p2u == true ) {
      ballVel.y -= ((paddleSpeed/4) * (level/1.25));
    }
    if (p2l == true ) {
      ballVel.x -= ((paddleSpeed/2) * (level/1.25));
    }
    if (p2r == true ) {
      ballVel.x += ((paddleSpeed/2) * (level/1.25));
    }
  }

  //Left Paddle Backface
  if (ballPos.y >= p1y - (paddleDim.y/2) && ballPos.y <= p1y + (paddleDim.y/2)
    && ballPos.x + (ballSize/2) < p1x - (paddleDim.x/2) && ballPos.x + (ballSize/2) >= p1x -(paddleDim.x/2) ) {
//    ballPos.x = p1x - (paddleDim.x/2) - (ballSize/2) - 1;
    ballVel.x*= -friction;

    //Apply paddle Speed to ball's movement
    if (p1d == true && paddleSpeed > 0) {
      ballVel.y += ((paddleSpeed/4) * (level/1.25));
    }
    if (p1u == true && paddleSpeed > 0) {
      ballVel.y -= ((paddleSpeed/4) * (level/1.25));
    }
    if (p1l == true && paddleSpeed > 0) {
      ballVel.x += ((paddleSpeed/2) * (level/1.25));
    }
    if (p1r == true && paddleSpeed > 0) {
      ballVel.x -= ((paddleSpeed/2) * (level/1.25));
    }
  }

  //Right Paddle Backface
  if (ballPos.y >= p2y - (paddleDim.y/2) && ballPos.y <= p2y + (paddleDim.y/2)
    && ballPos.x - (ballSize/2) > p2x + (paddleDim.x/2) && ballPos.x - (ballSize/2) <= p2x + (paddleDim.x/2) ) {
    //    ballPos.x =  p2x + (paddleDim.x/2) + (ballSize/2) + 1;
    ballVel.x*= -friction;

    //Apply paddle Speed to ball's movement
    if (p2d == true) {
      ballVel.y += ((paddleSpeed/4) * (level/1.25));
    }
    if (p2u == true) {
      ballVel.y -= ((paddleSpeed/4) * (level/1.25));
    }
    if (p2l == true) {
      ballVel.x += ((paddleSpeed/2) * (level/1.25));
    }
    if (p2r == true) {
      ballVel.x -= ((paddleSpeed/2) * (level/1.25));
    }
  }
}

//Ball Out

void ballOutP2() {
  if (ballPos.x - (ballSize/2) > width ) {
    for (int i = 0; i < 1000*1000; i++) {
      if (i == (1000*1000) - 1) {
        ballPos.x = posInit.x;
        ballPos.y = posInit.y;
        ballVel.x = velInit.x * -1;
        ballVel.y = velInit.y;
        ballOut = (p1Score + p2Score);
      }
    }
    p1Score +=1;
//    print(p1Score);
  }
}
void ballOutP1() {
  if (ballPos.x + (ballSize/2) < 1 ) {
    for (int i = 0; i < 1000*1000; i++) {
      if (i == (1000*1000) - 1) {
        ballPos.x = posInit.x;
        ballPos.y = posInit.y;
        ballVel.x = velInit.x;
        ballVel.y = velInit.y;
        ballOut = p1Score + p2Score;
      }
    }
    p2Score +=1;
//    print(p2Score);
  }
}



