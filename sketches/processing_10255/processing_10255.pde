
//global variables for ball

float ballSize = 10.0;             // the size of the ball 
//float ballDirectionX = 0.0;        // the ball's horizontal direction // left is negative, right is positive 
//float ballDirectionY = 1.5;        // the ball's vertical direction.// up is negative, down is positive 
//float ballPosX, ballPosY;          // the ball's vertical/horizontal and vertical positions 
//boolean ballInMotion = false;      // whether or not the ball should be moving 
//float gravity = 0.1; 
//float elasticity = -0.5;
//float ballDir = 1;
float ball_x;
float ball_y;
float ball_dir = 1;
float dy = 0;
//global variables for paddle

int paddleWidth = 10;
int paddleHeight = 40;
//float nextPaddleH;            // paddles horizontal position for the next player 
//float highestPaddleV;          // highest vertical position a paddle can reach
int distWall = 30;

void setup()  
{ 
  size(600, 600);
  rectMode(CENTER_RADIUS);
  ellipseMode(CENTER_RADIUS);
  //ballDirectionY = height/2;
 // ballDirectionX = 1;
 noStroke();
 ball_y = height/2;
 ball_x = 1;

    frameRate(90); 
}

void draw()
 {
 background(51);
 //ballDirectionX += ballDir * 2;
 //ballDirectionY += ballDir;
 //if(ballDirectionX < -ballSize){ //<<<<<<<<<<<<1
 //  ballDirectionX = width+ballSize;
  // ballDirectionY = random(0, height);
  // ballDir = 0;
  ball_x += ball_dir * 2;
 ball_y += dy;
 if(ball_x < -ballSize) { //<<<<<<<<<<<<1
   ball_x = width+ballSize;
   ball_y = random(0, height);
   dy = 0;
 }
 
 // Constrain paddle to screen
 float paddle_y = constrain(mouseY, paddleHeight, height-paddleHeight);

 // Test to see if the ball is touching the paddle
 //float py = distWall+paddleWidth+ballSize; //<<<<<<<<<<<<2
 //if(ballDirectionX == py 
 //   && ballDirectionY > paddle_y - paddleHeight - ballSize 
 //   && ballDirectionY < paddle_y + paddleHeight + ballSize) {
  // ballDir *= -1;
  // if(mouseY != pmouseY) {
  //   dy = (mouseY-pmouseY)/2.0;
  //   if(dy >  5) { dy =  5; }
  //   if(dy < -5) { dy = -5; }
 //  }
 float py = distWall+paddleWidth+ballSize; //<<<<<<<<<<<<2
 if(ball_x == py 
    && ball_y > paddle_y - paddleHeight - ballSize 
    && ball_y < paddle_y + paddleHeight + ballSize) {
   ball_dir *= -1;
   if(mouseY != pmouseY) {
     dy = (mouseY-pmouseY)/2.0;
     if(dy >  5) { dy =  5; }
     if(dy < -5) { dy = -5; }
   }
 } 
 
 // If ball hits paddle or back wall, reverse direction
 //if((ballDirectionX > 200-ballSize) && ballDir == 1) { //<<<<<<<<<<<<3
   //ballDir *= -1;
   
   if((ball_x > 200-ballSize) && ball_dir == 1) { //<<<<<<<<<<<<3
   ball_dir *= -1;

 }
 
 // If the ball is touching top or bottom edge, reverse direction
 //if(ballDirectionY > height-ballSize) {
  // dy = dy * -1;
  if(ball_y > height-ballSize) {
   dy = dy * -1;
 }
 if(ball_y < ballSize) {
   dy = dy * -1;

 //if(ballDirectionY < ballSize) 
  // dy = dy * -1;
 }

 // Draw ball
 fill(255);
 //ellipse(ballDirectionX, ballDirectionY, ballSize, ballSize);
  ellipse(ball_x, ball_y, ballSize, ballSize);

 // Draw the paddle
 fill(153);
 //rect(dist_wall, paddle_y, paddleWidth, paddleHeight); //<<<<<<<<<<<<4
 rect(distWall, paddle_y, paddleWidth, paddleHeight); 
}


