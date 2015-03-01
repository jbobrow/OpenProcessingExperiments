
PVector ballPos= new PVector(0, 0);
PVector ballVel= new PVector(-5, 2);
PVector paddleDim= new PVector(10, 80);
int p1x;
int p2x;
int p2y;
int p1y;
int lScore;
int rScore;
int paddleSpeed =15;
int ballSize = 20;
boolean p1u, p1d, p2u, p2d; 



void setup() {
  size(600, 600);
  //Initialize Score
  lScore=0;
  rScore=0;
  p1x=15;
  p2x=width-15;
  p1y=height/2;
  p2y=height/2;
  ballPos.x=width/2;
  ballPos.y=height/2;
  rectMode(CENTER);
}

void draw() {
  background(0);

  movementLogic();
  collisionLogic();
  //draw ball

  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);
  //draw paddle

    rect(15, p1y, paddleDim.x, paddleDim.y);
  rect(width-15, p2y, paddleDim.x, paddleDim.y);
  
  textSize(30);
  text(lScore,width*1/4,30);
  text(rScore,width*3/4,30);
}

void keyPressed() {
  //p1 paddle movement
  if (key== 'w') {
    p1u=true;
    p1d=false;
  }
  if (key== 's') {
    p1d=true;
    p1u=false;
  }
  //p2 paddle movement
  if (key== CODED) {
    if (keyCode==UP) {

      p2u=true;
      p2d=false;
    }
  }
  if (key== CODED) {
    if (keyCode==DOWN) {
      p2d=true;
      p2u=false;
    }
  }
}



void keyReleased() {
  //p1 paddle movement
  if (key== 'w') {
    p1u=false;
  }
  if (key== 's') {
    p1d=false;
  }
  //p2 paddle movement
  if (key== CODED) {
    if (keyCode==UP) {

      p2u=false;
    }
  }
  if (key== CODED) {
    if (keyCode==DOWN) {
      p2d=false;
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
  //left Paddle
  if (ballPos.x-ballSize/2 <= p1x+(paddleDim.x*.5)) {
    ballPos.x=1+ballSize/2+(p1x+(paddleDim.x*.5));
    ballVel.x*=-1;
    lScore++;
  }
  //right paddle
  if (ballPos.x+ballSize/2 >= p2x-(paddleDim.x*.5)) {
    ballPos.x=(p2x-(paddleDim.x*.5))-ballSize/2-1;
    ballVel.x*=-1;
    rScore++;
  }
  //top side
  if (ballPos.y-ballSize/2<=0) {
    ballPos.y+=1;
    ballVel.y*=-1;
  }
  //bottom side
  if (ballPos.y+ballSize/2>=height) {
    ballPos.y-=1;
    ballVel.y*=-1;
  }
}


// Perpect collision; boundaries, paddles ball; score



