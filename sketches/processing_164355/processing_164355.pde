
//perfect collision, boundaries for paddles and ball, score. Also make a variation of pong. Make it better or cooler. look up pippinbarr

PVector ballPos = new PVector(0, 0);
PVector ballVel = new PVector(10, 2);
int LScore;
int RScore;
int paddleSpeed = 20;

boolean p1u, p1d, p2u, p2d; //paddle position variables

PVector p1paddleDim = new PVector(0, 0);
PVector p2paddleDim = new PVector(0, 0);
int ballSize = 20;
int p1y;
int p2y;

int p1x;
int p2x;

PFont Bebas;
PFont SansSerif;

void setup() {
  rectMode(CENTER);
  size(600, 600);

  //font
  SansSerif = loadFont("SansSerif-48.vlw");
  Bebas = loadFont("BebasNeueRegular-255.vlw");

  //initialize score
  LScore = 0;
  RScore = 0;

  //declare ball position
  ballPos.x = width/2;
  ballPos.y = height/2;

  //declar paddle dimentions
  p1y = height/2;
  p2y = height/2;
  p1paddleDim.x = 10;
  p1paddleDim.y = height/3;
  p2paddleDim.x = 10;
  p2paddleDim.y = height/3;
  p1x = 15;
  p2x = width - 15;
}

void draw() {

  //background(0); 
  fill(0, 0, 0, 100);
  rect(width/2, height/2, width, height);



  //draw ball

  movementLogic();

  collisionLogic();

  //call update score function
  updateScore(); 

  //call winning announcemnt logic
  winningLogic();

  //draw paddle

  updatePaddles();
  //p1 paddles
  fill(0,0,255);
  rect(15, p1y, p1paddleDim.x, p1paddleDim.y);


  //p2 paddles
  fill(255,0,0);
  rect(width-15, p2y, p2paddleDim.x, p2paddleDim.y);
}






void keyPressed () {
  if (key == 'w') {
    p1u = true;
    p1d = false;
  }

  if (key == 's') {
    p1d = true;
    p1u = false;
  }


  if (key == CODED) {
    if (keyCode == UP) {
      p2u = true;
      p2d = false;
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

  if (key == 'w') {
    p1u = false;
  }

  if (key == 's') {
    p1d = false;
  }


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


void updatePaddles() {

  if (p1u) p1y -= paddleSpeed; //move paddle up
  if (p1d) p1y += paddleSpeed; //move paddle down
  if (p2u) p2y -= paddleSpeed; //move paddle up
  if (p2d) p2y += paddleSpeed; //move paddle down

  if (p1u) {
    if (p1y - (p1paddleDim.y/2) + 10 <= 0) {
      p1y += paddleSpeed;
    }
  }

  if (p1d) {
    if (p1y + (p1paddleDim.y/2) - 10 >= height) {
      p1y -= paddleSpeed;
    }
  }

  if (p2u) {
    if (p2y - (p2paddleDim.y/2) + 10 <= 0) {
      p2y += paddleSpeed;
    }
  }

  if (p2d) {
    if (p2y + (p2paddleDim.y/2) - 10 >= height) {
      p2y -= paddleSpeed;
    }
  }
}

void movementLogic() {

  ballPos.x -= ballVel.x;
  ballPos.y += ballVel.y;
  noStroke();
  fill(255, 0, 0);
  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);
}

void collisionLogic() {
  //left paddle boundary
  if (ballPos.x - (ballSize/2) <= p1x + (p1paddleDim.x)
    && ballPos.y - ballSize/2 <= p1y + (p1paddleDim.y/2)
    && ballPos.y - ballSize/2 >= p1y - (p1paddleDim.y)) {
    //ballPos.x = (p1x+(paddleDim.x * 0.5)) + 1 + ballSize/2;
    ballVel.x *= -1;
  }

  //right paddle boundary
  if (ballPos.x + (ballSize) >= p2x + (p2paddleDim.x)
    && ballPos.y + (ballSize/2) <= p2y + (p2paddleDim.y/2)
    && ballPos.y + (ballSize/2) >= p2y - (p2paddleDim.y/2)) {

    ballVel.x *= -1;
  }



  //bottom wall
  if (ballPos.y + (ballSize/2) >= height) {
    ballVel.y *= -1;
  }

  //Top wall
  if (ballPos.y - (ballSize/2) <= height-height) {
    ballVel.y *= -1;
  }
}

void updateScore() {
  //Score
  fill(255, 0, 0, 50);
  textSize(64);
  textAlign(CENTER);  
  textSize(46);
  textFont(Bebas, 255);

  //String s = (""+RScore);
  //right score  
  text(""+RScore, 400, 400);
  if (ballPos.x <= 0) {
    RScore += 1;
    ballPos.x = width/2;
    ballVel.x *= -1;
    //ballVel.x -= 1;
    p1paddleDim.y -= 10;

    if (p1paddleDim.y <= 30) {
      p1paddleDim.y = 30;
    }
  }

  //left score
  fill(0,0,255,50);
  text(""+LScore, 200, 400);
  if (ballPos.x > width) {
    LScore += 1;
    ballPos.x = width/2;
    ballVel.x *= -1;
    //ballVel.x += 1;
    p2paddleDim.y -= 10;

    if (p2paddleDim.y <= 30) {
      p2paddleDim.y = 30;
    }
  }
}

void winningLogic () {

  if (RScore == 15) {
    fill(255, 0, 0);
    textSize(46);
    text("Player 2 Wins!", 400, 400);
    ballVel.x = 0;
    ballVel.y = 0;
  }

  if (LScore == 15) {
    fill(0, 0, 255);
    textSize(46);
    text("Player 1 Wins!", 200, 400);
    ballVel.x = 0;
    ballVel.y = 0;
  }

  if (ballVel.x == 0) {
    fill(random(255),0,random(255));
    rect(0, height-15, width*2, 80); 
    fill(255);
    textSize(46);
    text(">>> Play Again? <<<", 300, height-10);
  }

  if (mouseY >= height-80 && ballVel.x == 0) {
    LScore = 0;
    RScore = 0;
    ballVel.x = 4;
    ballVel.y = 2;
    p1paddleDim.y=height/3;
    p2paddleDim.y=height/3;
    fill(255, 0, 0);
    rect(width/2, height/2, width, height);
  }
}






