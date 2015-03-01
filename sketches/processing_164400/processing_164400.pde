
PVector ballPos = new PVector(0,0);
PVector ballVel = new PVector(8,2);
PVector paddleDim = new PVector(15,60);


int lScore;
int rScore;
int paddleSpeed = 20;

boolean p1u,p1d,p2u,p2d; //paddle position variables

int ballSize = 20;
int p1y;
int p2y;
int p1x;
int p2x;




void setup() {
  rectMode(CENTER);
  size(600,600);
  
  //initialize score
  lScore = 0;
  rScore = 0;
  
  //declare ball position
  ballPos.x = width/2;
  ballPos.y = height/2;
  
  //declar paddle dimentions
  p1y = height/2;
  p2y = height/2;
  paddleDim.x = 10;
  paddleDim.y = height/4;
  p1x = 15;
  p2x = width - 15;
}

void draw() {
 
 background(0); 
 
 //draw ball
 ellipse(ballPos.x, ballPos.y,ballSize,ballSize);
 
  //p1 paddle
 rect(23,p1y,paddleDim.x, paddleDim.y);
 
 //p2 paddle
 rect(width-23, p2y, paddleDim.x, paddleDim.y);
 
 //score
 textSize(15);
 text(lScore, width/50, 590);
 text(rScore, width-23, 590);

  //functions
  movementLogic(); 
  collisionLogic();
  updateScore();
}


void movementLogic() {
 //paddle movmement
 if(p1u) p1y -= paddleSpeed; //move paddle up
 if(p1d) p1y += paddleSpeed; //move paddle down
 if(p2u) p2y -= paddleSpeed; //move paddle up
 if(p2d) p2y += paddleSpeed; //move paddle down

 //ball movement
 ballPos.x += ballVel.x;
 ballPos.y += ballVel.y;
}


void collisionLogic() {
  
    //CREDIT: Daniel Fernades Ribeiro
  
  //top wall
  if (ballPos.y < ballSize/2)
  {
    ballPos.y = ballSize/2;
    ballVel.y *= -1;
  }
 
 //botom wall
 if (ballPos.y > height-ballSize/2)
  {
    ballPos.y = height-ballSize/2;
    ballVel.y *= -1;
  }
  
  if (ballPos.x - ballSize/2 <= p1x+(paddleDim.x/2 ) && ballPos.x - ballSize/2 > p1x - paddleDim.x/2 && ballPos.y <p1y + paddleDim.y/2 && ballPos.y > p1y - paddleDim.y/2) {
    ballPos.x = 1 + ballSize/2 + (p1x+(paddleDim.x/2 ));
    ballVel.x *= -1;
  }
 
  //Right Paddle
  if (ballPos.x + ballSize/2 >= p2x-(paddleDim.x/2 ) && ballPos.x - ballSize/2 < p2x + paddleDim.x/2 && ballPos.y > p2y - paddleDim.y/2 && ballPos.y < p2y + paddleDim.y/2) {
    ballPos.x = (p2x-(paddleDim.x/2 ))- 1 - ballSize/2;
    ballVel.x *= -1;
  }
  if (ballPos.y - ballSize/2 < 0 || ballPos.y + ballSize/2 > height - 40 ) {
    ballVel.y *=-1;
  }
}




void updateScore () {
  if (ballPos.x <= 5) {
    lScore++;
    ballVel.x *= -1;
    ballVel.y *= -1;
  }
  if (ballPos.x +ballSize/2 >= width - 5) {
   rScore++; 
    ballVel.x *= -1;
    ballVel.y *= -1;
  }
  if (rScore == 10) {
    text("P1 WINS", 30, height/2);
    delay(2500);
    reset();
  }
  if (lScore == 10) {
    text ("P2 WINS", 30, height/2);
    delay(2500);
    reset();
  }
}

void reset() {
  lScore = 0;
  rScore = 0;
}
  
//controls
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



