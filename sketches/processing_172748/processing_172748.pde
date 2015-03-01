
float ballX;
float ballY;
int ballSpeedX = 5; // the speed of ballX will be starting at 5
int ballSpeedY = 5; // the speed of ballY will be starting at 5
int paddleHeight = 30; 
int paddleColor; 
int ballsize=35; //the height and width of the ball will start at 35
int paddlew=200; // the width of the paddle will start at 200
int score=0; // the score will start with 0
PFont f;



// this code will only run once
void setup() {
  size(800, 600);// set the size of the canvas
  noCursor(); // you will not see your mouse on the canves
  ballX =random(100,700); // the ball will randomly appear in the x axis
  ballY = random(100,500); // the ball will randomly appear in the y axis
  f = createFont("Arial",50,true); // the font, size and condition of the text
}

void draw() {

 background(0); // set background to black
// The functions, it will be explained in the bottom 
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
   small();
 
   textAlign(LEFT); // the text will show on the left side
text("score = "+score,100,100); // the canvas will shows how many score do you have
textFont(f);     // set the size and the font  
 
}

void moveBall() {
  ballX = ballX + ballSpeedX; // the value of ballX will be increase by adding the speed for ballX
  ballY = ballY + ballSpeedY;// the value of ballY will be increase by adding the speed for ballY
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); // The number of the //speed for ball X and Y will be shown in the bottom
}

void checkCollide() {
 
  if (ballX < 0 || ballX > width) {   // if the ball touches the left side or the right side, the ball will bounce
    ballSpeedX = ballSpeedX * -1;// the ball will bounce by negate the ballSpeed
  }
  if (ballY < 0) { // if the ball touches the canvas on the top, the ball will bounce
    ballSpeedY = ballSpeedY * -1; // the ball bounce bc the speedY negate to negative number
  }
  if (ballY > height-paddleHeight) { // if the y value of the ball is greater than the height of the //paddle than it will goes to the next code
    if (ballX > mouseX && ballX < mouseX + 200) {  // if the x value of the ball is greater the x value of your mouse and is greater than the whole paddle than it will bounce off
      ballSpeedY = ballSpeedY * -1;
      score++; // the score will increase 1 point if the ball touches the paddle
fill( random(224), random(224), random(224));
    } else {
      text("GAME OVER!", width/2, height/2); // if the ball didn’t touch the paddle then the game is //over
      noLoop(); // it will not repeat
    }
  }
}

void drawBall() { 
    stroke(255,255,0);
  ellipse(ballX, ballY, ballsize, ballsize); // the location of the ball and the size( width and height) of the circle
}

void drawPaddle() {
  stroke(paddleColor); // the stroke will be same as the paddle color
  strokeWeight(4);// the thickness of the stroke
  rect(mouseX, height-paddleHeight-4, paddlew, paddleHeight); }// the rect will move depend of your //mouse, the length of the paddle will be 200 and the height will be 30
void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
//  the scale of the bottom will be set as 0 to 225(color scale) instead of 0 to 800 and the color of //the paddle will changes depend on the location of the mouse
}

void keyPressed() { 
  if (key == 'b' || key == 'B') { // if you pressed the B or the b then the scream will resume
    loop(); // resume
  }

  if (key == 'w' || key == 'W') { // your screen will stop if you pressed W or w
       noLoop();// the pause feature
  }
}

void small(){// to make the ball get smaller every time it touches the paddle
  if (ballY > height-paddleHeight) {
    if (ballX > mouseX && ballX < mouseX + 200) {
       paddlew-=10;
        if (ballsize>5){
   ballsize-=5;
  
  
    }
    }
  }
}
