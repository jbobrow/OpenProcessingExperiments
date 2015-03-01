
PVector ballPos = new PVector(0, 0);
PVector ballVel = new PVector(7, 3);
PVector paddleDim = new PVector(10, 80);
 
int p1x;
int p2x;
 
int p1y;
int p2y;
 
int a = 255;
int b = 255;
int c = 255;
 
boolean p1u, p1d, p2u, p2d;
 
 
int lScore = 0;
int rScore = 0;
int LScore = 0;
int RScore = 0;
 
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
  score();
  movementLogic();
  collisionLogic();
  scoreLogic();
  fill(a,b,c);
  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);
  fill(255);
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
 
 
void score(){
  textSize(60);
  text(lScore, 220, 100);
  text("|", 300, 100);
  text(rScore, 360, 100);
  textSize(20);
  text(LScore, 20, 100);
  text(RScore, 560, 100);
}
 
 
 
void movementLogic() {
  ballPos.x += ballVel.x;
  ballPos.y += ballVel.y;
 
  if (p1u) p1y -= paddleSpeed;
  if (p1d) p1y += paddleSpeed;
  if (p2u) p2y -= paddleSpeed;
  if (p2d) p2y += paddleSpeed;
  
  if (p2y<=40||p1y<=40){
    p1u = false;
    p2u = false;
  }
  
  if(p2y>=height-paddleDim.y||p1y>=height-paddleDim.y){
    p1d = false;
    p2d = false;
  }
  
  //it doesn't stop the paddle but slow them down for some reason?
}

 
 
 
 
void collisionLogic() {
  //Left Paddle
  if (ballPos.x - ballSize/2 <= p1x+(paddleDim.x * .5 )) {
    ballPos.x = 1 + ballSize/2 + (p1x+(paddleDim.x * .5 ));
    ballVel.x *= -1;
    fill(#FF0033); // the color wouldn't change for some reason
    if(ballPos.y <= (p1y- paddleDim.y/2)||ballPos.y >= (p1y + paddleDim.y/2)){
        rScore++;
      }
    }
 
  //Right Paddle
  if (ballPos.x + ballSize/2 >= p2x-(paddleDim.x * .5 )) {
    ballPos.x = (p2x-(paddleDim.x * .5 ))- ballSize/2 - 1;
    fill(#FF0033);
    ballVel.x *= -1;
      if(ballPos.y <= (p2y- paddleDim.y/2)||ballPos.y >= (p2y + paddleDim.y/2)){
        lScore++;
      }
  }
  
  if (ballPos.y - ballSize/2 >= height-20){
    ballVel.y *=-1;
  }
  
  if (ballPos.y - ballSize/2 <= 10){
    ballVel.y *=-1;
  }
}



//start a new round when the score gets to 10
void scoreLogic(){
  if (lScore > 10){
    println(lScore);
    LScore++;
    lScore = 0;
    rScore = 0;
    ballVel.x ++;
    ballVel.y += 2;
  }else if(rScore > 10){
    println(rScore);
    RScore++;
    rScore = 0;
    lScore = 0;
    ballVel.x ++;
    ballVel.y += 2;
  }
}

