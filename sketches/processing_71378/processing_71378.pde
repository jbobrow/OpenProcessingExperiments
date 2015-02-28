
/*This is Pong Solitaire (player vs. self).
Only one paddle is under the player's control at a time.
Spacebar to start the game.
Switch between active paddles with right and left arrows.
Move up and down with up arrows.
*/
//paddle size and position
int paddleW = 10;
int paddleH = 100;
int paddle1x;
int paddle1y;
int paddle2x;
int paddle2y;

//ball variable
int ballX = 300;
int ballY = 200;
//speed at which ball travels
int speedX = 4;
int speedY = 3;
//direction ball travels
int xdirection;
int ydirection;
//whether game is in PROGress
boolean prog = false;
//which side is active
boolean right = true;
//randomish color of active paddle
color c;

void setup() { 
  size(600,400);
  paddle1x = 25;
  paddle1y = height / 2;
  paddle2x = 575;
  paddle2y = height / 2;
  ellipseMode(RADIUS);  
}

void draw() {
//cool, flashy random colors fill for active paddle
  c = int(random(150, 255));
//decorative stuff  
  background(30);
  rectMode(CENTER);
  fill(40);
  rect(width/2, height/2,width - 20, height-18);
  fill(255);
//if game is in progress, move ball.   
  if (prog) {
  ballX = ballX + (speedX * xdirection);
  ballY = ballY + (speedY * ydirection);
    } 
//if ball is out of bounds, stop game. return to start.     
if(ballX > width-10 || ballX < 10 ) {
    ballX = 300;
    ballY = 200;
    prog = false;
  }
  
//if ball hits either paddle, reverse direction   
if(ballX > paddle2x - paddleW*2) {
    if(ballY < paddle2y + paddleH-5 && ballY > paddle2y - paddleH){
      xdirection *= -1;
  }
 }
  if(ballX < paddle1x + paddleW*2) {
    if(ballY < paddle1y + paddleH-5 && ballY > paddle2y - paddleH){
      xdirection *= -1;
  }
 }

//if ball hits wall, reverse direction
  if(ballY > height-10 || ballY < 10) {
     ydirection *= -1;
  }

//if game is not in progress, draw ball in center of screen
if (!prog) {
  ellipse(300, 200, 20, 20);
}
//otherwise, draw active ball
  ellipse(ballX, ballY, 20, 20);

//if paddle is active, draw larger flashy box behind it
  if (right) {
    fill(c);
    rect(paddle2x,paddle2y,paddleW+5,paddleH+5);
  }  
  if (!right) {
    fill(c);
    rect(paddle1x,paddle1y,paddleW+5,paddleH+5);
  }
//draw paddles  
  fill(255, 150);
  noStroke();
  rect(paddle1x,paddle1y,paddleW,paddleH);
  rect(paddle2x,paddle2y,paddleW,paddleH);

//if spacebar, start game
if (keyPressed) {
  if (key == ' ' && !prog) {
    xdirection = int(random(1,3));
    ydirection = int(random(1,4)); 
    prog = true;   
  }
//make right paddle active  
  if (key == CODED) {
    if (keyCode == RIGHT) {
      right = true;
    }
//make left paddle active  
    if (keyCode == LEFT) {
      right = false;
    }
//move whichever paddle is active up    
    if (keyCode == UP) {
        if(paddle1y >  paddleH/2 + 20 ){
           if (!right) {
             paddle1y-=5;
           }
          }
           if (right) {
         if(paddle2y >  paddleH/2 + 20 ){
             paddle2y-=5;
             }
           }
       }
//move whichever paddle is active down       
     if (keyCode == DOWN) {
       if(paddle1y < height - paddleH/2 - 20){
           if (!right) {
             paddle1y+=5;
           }
       }
       if(paddle2y < height - paddleH/2 - 20){       
           if (right) {
             paddle2y+=5;
             }
           }
         }
        }
     }       
  }
