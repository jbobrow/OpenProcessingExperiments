
int ballX;              
int ballY;              
int ballSpeedX = 5;     
int ballSpeedY = 5;    //all global variables
int paddleHeight = 30;  
int paddleColor; 
int score = 0;
void setup() {
  size(800, 600);   // canvas size
  noCursor();       // hides the mouse
  ballX = width/2;  
  ballY = height/2; 
}
 
void draw() {
  background(128);//color of background
  moveBall();      
  checkCollide();  
  drawPaddle();    
  drawBall();      
  score();        
  
}
 //The movement of the ball
void moveBall() {
  ballX = ballX + ballSpeedX; 
  ballY = ballY + ballSpeedY; 
  
  // monitor speed/direction of ball
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); 
}
 
void checkCollide() {
 // bounces off of the x axis of the ball is less than or greater than left and right edges  
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1 ; // switch X direction
  }
  
  // top edge
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; // switch Y direction
  }
  
  // paddle
  if (ballY > height-paddleHeight) { // past 'goal line'
    if (ballX > mouseX && ballX < mouseX + 200) { // within paddle
      ballSpeedY = ballSpeedY * -1; // switch Y direction
      score();
    } else { // end game
      text("GAME OVER!", width/2, height/2);
      noLoop();
    }
  }
}
 
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}
 
void drawPaddle() {
  stroke(paddleColor); 
  strokeWeight(4); // border thickness of 4px
  
  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
}
 
void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-255
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}
 
void keyPressed() {
  // changes color, b is black, and w is white
    if (key == 'b' || key == 'B') {
    fill(0);
  }
  if (key == 'w' || key == 'W') {
    fill(255);
  }
}
void score(){
  float distance = abs(mouseX - ballX); //distance defined
  textSize(40); //how big the text is
  text("Score: " + score,0,1,400,400); //when the paddleHeight is greater than distance
   if(distance <paddleHeight) score+=1; //how the scoring system works
}

