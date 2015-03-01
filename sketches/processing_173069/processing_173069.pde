
//CODE BY KIM KOEHLER, based on base by ANTONY MAREFATK, and with help from Openprocessing.
 
 
PVector ballPos = new PVector(0,0);
PVector ballVel = new PVector(-4,2);
PVector paddleDim = new PVector(10,80);
int p1y;
int p2y;
 
int p1x;
int p2x;
 
boolean p1u, p1d, p2u, p2d;
 
int lScore;
int rScore;
 
int paddleSpeed = 7;
int ballSize = 20;

boolean paused = false; 
 
 
 
void setup(){
  size(600,600);
   
  //Initialaze score
  lScore = 0;
  rScore = 0;
   
  loadFont("Arial-Black-48.vlw");
  
   
  p1y= height/2;
  p2y=height/2;
   
  p1x= 15;
  p2x= width-15;
  rectMode(CENTER);
   
  ballPos.x = width/2;
  ballPos.y = height/2;
}
 
void draw(){
  background(0);
  smooth();
  if (!paused){
  movementLogic();
  collisionLogic();
  scoreLogic();
 
  //ball
 fill(255);
  ellipse(ballPos.x, ballPos.y, ballSize+random(-3.5,8), ballSize+random(-3.5,8));
   
  //paddle
   
  if(p1u) p1y -= paddleSpeed;
  if(p1d) p1y += paddleSpeed;
  if(p2u) p2y -= paddleSpeed;
  if(p2d) p2y += paddleSpeed;
  rect(15,p1y, paddleDim.x, paddleDim.y,50);
  rect(width-15 ,p2y, paddleDim.x, paddleDim.y,50);
  }
}
 
void keyPressed(){
  
  if(key == 'p'){
    paused = true;
    fill(255);
  textSize(28);
  text("PRESS ANY KEY TO CONTINUE", width/2-width/4,height/2);
  }
  else {
   paused = false; 
  }
  //p1 paddle movement
  if(key == 'w'){
    p1d = false;
    p1u = true;
  }
   
  if(key == 's'){
    p1d = true;
    p1u = false;
  }
  //p2 paddle movement
   
  //ref processing documentation
  if (key == CODED) {
    if(keyCode == UP){
    p2d = false;
    p2u = true;
  }
   
  if(keyCode == DOWN){
    p2d = true;
    p2u = false;
  }
  }
}
 
void keyReleased(){
   //p1 paddle movement
  if(key == 'w'){
    p1u = false;
   
  }
   
  if(key == 's'){
   
    p1d = false;
  }
  //p2 paddle movement
   
  //ref processing documentation
  if (key == CODED) {
    if(keyCode == UP){
    p2u = false;
   
  }
   
  if(keyCode == DOWN){
     
    p2d = false;
  }
   
}
   
}
void movementLogic(){
   
   ballPos.x += ballVel.x;
   ballPos.y +=ballVel.y;
    
  if(p1u) p1y -= paddleSpeed;
  if(p1d) p1y += paddleSpeed;
  if(p2u) p2y -= paddleSpeed;
  if(p2d) p2y += paddleSpeed;
}
 
 
void collisionLogic() {
   
   // walls
  if (ballPos.y + (ballSize/2) >= height) {
    ballVel.y *= -1;
  }
  
  if (ballPos.y - (ballSize/2) <= height-height) {
    ballVel.y *= -1;
  }
 
   
  //left Paddle
  if ((ballPos.x - ballSize/2 <= p1x+(paddleDim.x/2))) {
    if ((ballPos.y >= p1y-(paddleDim.y/2)) && (ballPos.y <= p1y+(paddleDim.y/2))) {
      ballPos.x = 1 + ballSize/2 + (p1x+(paddleDim.x/2));
      ballVel.x  *= -1;

    }
  }
  //right Paddle
  if (ballPos.x + ballSize*0.5 >= p2x-(paddleDim.x*0.5)) {
    if ((ballPos.y >= p2y-(paddleDim.y*0.5)) && (ballPos.y <= p2y+(paddleDim.y*0.5))) {
      ballPos.x = (p2x-(paddleDim.x*0.5)) - ballSize*0.5 -1;
      ballVel.x *= -1;

    }

   
 
 
  }
  }
 
 
void scoreLogic(){
 
  fill(255);
  textSize(48);
  text(""+rScore, 550,550);
  if(ballPos.x <0) {
    rScore ++;
    ballPos.x = width/2;
    ballVel.x *=-1;
  }
 fill(255);
  textSize(48);
  text(""+lScore, 50,50);
  if(ballPos.x >width) {
    lScore ++;
    ballPos.x = width/2;
    ballVel.x *=-1;
  }
}



