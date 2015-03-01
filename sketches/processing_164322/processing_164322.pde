
PVector ballPosition = new PVector(0,0);
PVector ballSpeed = new PVector(5,3);
PVector paddleDim = new PVector(10,80);

float p1x, p2x, p1y, p2y;

boolean p1u, p1d, p2u, p2d;

int lScore, rScore;

int paddleSpeed = 5;
int paddleSpeed2 = 5;
int ballSize = 20;


void setup(){
  size(600, 640);
  
  lScore = 0;
  rScore = 0;
  
  p1x = 15;
  p2x = width - p1x;
  
  p1y = height/2;
  p2y = height/2;
  
  rectMode(CENTER);
  
  ballPosition.x = width/2;
  ballPosition.y = height/2;
  
}


void draw(){
  background(0);
  noStroke();
  
  updatePaddlesAndBall();
  collisionLogic();
  updateScores();
  
  ellipse(ballPosition.x, ballPosition.y, ballSize, ballSize);
  
  rect(p1x, p1y, paddleDim.x, paddleDim.y);
  rect(p2x, p2y, paddleDim.x, paddleDim.y);
  rect(width/2, height - 40, width, 1);
  
  textSize(30);
  
  text(rScore, p1x, height-10);
  text(lScore, p2x - (2 * paddleDim.x), height-10);
}


void keyPressed() {
  
  //P1 Controls
  if(key =='w'){
    p1u = true;
    p1d = false;
  }
  if(key =='s'){
    p1d = true;
    p1u = false;
  }
  
  //P2 Controls
  if(key == CODED){
    if(keyCode == UP){
      p2u = true;
      p2d = false;
    }
  }
  if(key == CODED){
    if(keyCode == DOWN){
      p2d = true;
      p2u = false;
    } 
  }
}


void keyReleased(){
 
  //P1 Controls
  if(key =='w'){
    p1u = false;
  }
  if(key =='s'){
    p1d = false;
  }
  
  //P2 Controls
  if(key == CODED){
    if(keyCode == UP){
      p2u = false;
    }
  }
  if(key == CODED){
    if(keyCode == DOWN){
      p2d = false;
    } 
  }
  
}


void updatePaddlesAndBall(){
  
  //Paddle movement
  
  //Player 1
  if(p1u) {
    if (p1y > paddleDim.y/2){
      p1y -= paddleSpeed;
    }
  }
  
  if(p1d){
    if (p1y < height - paddleDim.y/2 - 50){
      p1y += paddleSpeed;
    }  
  }
  
  //Player 2
  if(p2u){
   if (p2y > paddleDim.y/2){
      p2y -= paddleSpeed2;
    }
  }
  
  if(p2d){
    if (p2y < height - paddleDim.y/2 - 50){
      p2y += paddleSpeed2;
    }
  }
  
  //Ball movement
  ballPosition.x += ballSpeed.x;
  ballPosition.y += ballSpeed.y;
  
}

/* Change the direction of the ball when hits a paddle
 * It also add speed to the ball everytime it hits, so the game becomes harder over time
 */


void collisionLogic(){
  //Left paddle
  if(ballPosition.x - ballSize/2 <= p1x + (paddleDim.x/2) && ballPosition.x - ballSize/2 > p1x - paddleDim.x/2 && ballPosition.y < p1y + paddleDim.y/2 && ballPosition.y > p1y - paddleDim.y/2){
    ballPosition.x = 1 + ballSize/2 +  (p1x + (paddleDim.x/2)); 
    ballSpeed.x *= -1.05;
    
  }
  
   //Right paddle
  if(ballPosition.x + ballSize/2 >= p2x - (paddleDim.x/2) && ballPosition.x - ballSize/2 < p2x + paddleDim.x/2 && ballPosition.y > p2y - paddleDim.y/2 && ballPosition.y < p2y + paddleDim.y/2 ){
    ballPosition.x = (p2x - (paddleDim.x/2)) - 1 - ballSize/2 ; 
    ballSpeed.x *= -1.05;
  }
  
  if (ballPosition.y - ballSize/2 < 0 || ballPosition.y + ballSize/2 > height - 40 ){
     ballSpeed.y *=-1;   
  } 
  
}

/* Add scores to a player when the ball get out of the screen
 * It also changes the speed of the paddle that looses the ball
 * And resets the position and the speed of the ball
 */
 
void updateScores(){
  
 if (ballPosition.x + 200 < 0){
  lScore++;
  ballPosition.x = width/2;
  ballPosition.y = height/2;
  ballSpeed.x = 5;
  paddleSpeed = 8;
  paddleSpeed2 = 5;
  ballSpeed.x *= -1;
  ballSpeed.y *= -1;
 } 
 if (ballPosition.x + ballSize/2 > width + 200){
  rScore++;
  ballPosition.x = width/2;
  ballPosition.y = height/2;
  ballSpeed.x = 5;
  paddleSpeed = 5;
  paddleSpeed2 = 8;
  ballSpeed.x *= -1;
  ballSpeed.y *= -1;
 }
  
}


