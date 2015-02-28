
float xPaddle = 50;
float speedX = random(5);
float speedY = random(5);
float ballX = 250;
float ballY = 250;
float lives = 9;
float marker = 1;

void setup() {
  size(600,600);
}

void draw(){
  background(0);
  fill(255);
  stroke(0);
  rect(xPaddle,550,50,10);
   if (xPaddle == 0) {
    xPaddle = xPaddle +10;
  }
  if  (xPaddle == 550){
    xPaddle = xPaddle -10;
  }
  
  
speedchange();
drawball();
scoring();

textSize(32);
text((lives/3),10,30);
  
  if (lives ==0){
    stop();
  }
  
  
  
  
  
  

}
void keyPressed() {
   if (xPaddle >0 && xPaddle <550){
      if (key == 'd') {
          xPaddle = xPaddle +10;
      }
      if (key == 'a') {
          xPaddle = xPaddle -10;
    
      }
 
  }
 
    
}

void speedchange() {
    if (ballX >= width) {
    speedX=speedX *-1;
  }
    if (ballX <= 0) {
    speedX=speedX *-1;
  }
  if (ballY >=height){
    speedY = speedY * -1;
  }
  if (ballY <= 0) {
    speedY = speedY * -1;
  }
  ballX = ballX + speedX;
  ballY = ballY +speedY; 
  
  if ((ballY >= 550) && (ballY <= 560)) {
  if ((ballX <=(xPaddle +50)) && (ballX >= xPaddle)){
    speedX = speedX * -1;
    speedY = speedY * -1;
  }
  
  }
}

void drawball() {
    ellipse(ballX,ballY,20,20);
}
  
void scoring() {

  
  if (ballY >= 597){
     lives--;
     
  }
  
}
  
  // NOTE: code will only run as java file, code will not work when run as a javascript file.
  // code will need to be copied into processing app to be run
