
PVector ballPos = new PVector(0, 0);
PVector ballVel = new PVector(-4, -2);
int ballSize = 20;

PVector paddleDim = new PVector(10, 80);

int lScore;
int rScore;
float paddleSpeed = 10;

float boom;

int p1x;
int p1y;
int p2x;
int p2y;



//control
boolean p1u, p1d, p2u, p2d;


void setup() {
  noStroke();
  size(600, 600);

  lScore = 0;
  rScore = 0;

  p1y = height/2;
  p1x =15;
  p2y = height/2;
  p2x = width - 15;

  ballPos.y = width/2;
  ballPos.x = height/2;
  rectMode (CENTER);
}

void draw() {
  
 

  //fill(random(255), random(255), random(255), random(1, 2));
  //rect(height/2, width/2, height, width);
  //draw ball
  fill(random(200, 255), random(200, 255), random(200, 255), random(100, 200));
  ellipse(ballPos.x, ballPos.y, ballSize + random(-10, 10), ballSize + random(-10, 10));
  //fill(0, 0, 0, 0);
  //ellipse(ballPos.x, ballPos.y, ballSize, ballSize);







  // draw paddle
  fill(random(200, 255), random(200, 255), random(200, 255), random(100, 200));

  movementLogic();
  coLogic();

  rect(p1x, p1y, paddleDim.x, paddleDim.y);
  rect(p2x, p2y, paddleDim.x, paddleDim.y);
  coLogic();

  textSize(random(1, 30));

  text(lScore, p1x -random(-3, 3), height-random(5, 10));
  text(rScore, p2x - random(-3, 3), height-random(5, 10));
}
// control

void keyPressed() {
  if (key == 'w') {
    p1d = false;
    p1u = true;
  }

  if (key == 's') {
    p1u = false;
    p1d = true;
  }

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


void movementLogic() {
  ballPos.x += ballVel.x;
  ballPos.y += ballVel.y;


  if (p1u) p1y -= paddleSpeed + random(-10, 10);
  if (p1d) p1y += paddleSpeed + random(-10, 10);

  if (p2u) p2y -= paddleSpeed + random(-10, 10);
  if (p2d) p2y += paddleSpeed + random(-10, 10);
}


void coLogic() {
  //Left 
  if (ballPos.x - ballSize/2 <= p1x+(paddleDim.x * .5 ) && ballPos.x >= p1x-(paddleDim.x * .5 )) {
    if (ballPos.y >= p1y - (paddleDim.y/2) && ballPos.y <= p1y + (paddleDim.y/2)) {
      ballPos.x = 1 + ballSize/2 + (p1x+(paddleDim.x * .5 ));
      ballVel.x *= -1;
      boom();
    }
  }
  //Right 
  if (ballPos.x + ballSize/2 >= p2x-(paddleDim.x * .5 )&& ballPos.x <= p2x+(paddleDim.x * .5 )) {
    if (ballPos.y >= p2y - (paddleDim.y/2)  && ballPos.y <= p2y + (paddleDim.y/2)) {
      ballPos.x = (p2x-(paddleDim.x * .5 ))- ballSize/2 - 1;
      ballVel.x *= -1;
      boom();
    }
  }
  //wall
  //left
  if (ballPos.x + ballSize/2 <= -5  ) {

    ballPos.x = 1 ;
    ballVel.x *= -1;
    rScore = rScore + 1;
    //println("player 2 " + rScore);
    boom();
  }
  //Right 
  if (ballPos.x - ballSize/2 >= width) {

    ballPos.x =width - 1;
    ballVel.x *= -1;
    lScore = lScore + 1;
    //println("player 1 " + lScore);
    boom();
  }

  if ( ballPos.y <= 0 ) {
    //print("what");
    ballPos.y = 1;
    ballVel.y *=-1;
    
  }

  if ( ballPos.y >= height - 10 ) {
     ballPos.y = height - 11;
    ballVel.y *=-1;
   
  }
}

void boom(){
  fill(0,0,0,100);
  rect(width/2,height/2,width,height);
  
  
}



