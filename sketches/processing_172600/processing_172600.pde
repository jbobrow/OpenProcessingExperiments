
 // global variables, able to be used in all functions
int ballX;              // x-location of the ball
int ballY;              // y-location of the ball
int ballSpeedX = 5;     // speed of the ball horizontally
int ballSpeedY = 5;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
int score = 0;          //score, how many times ball bounces off wall
int paddleColor;        // color of the paddle
 
void setup() {
  size(800, 600);   // canvas size
  noCursor();       // hides the mouse
  ballX = width/2;  // start the ball in the
  ballY = height/2; //   middle of the canvas
}
 
void draw() {
  background(0,225,50); // resets the background
  start();// will start when 's' is clicked
  INDUTIAE();//latin for pause
  fill(random(20,22,225),random(25,155,5),random(0,222,0));
  textSize(25);
  text("SCORE " + score, 1,20);
  
}
 
void moveBall() {
  ballX = ballX + ballSpeedX; // updates ball location horizontally
  ballY = ballY + ballSpeedY; // updates ball location vertically
  
  // monitor speed/direction of ball
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); 
}
 
void checkCollide() {
  // left/right edge
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1; // switch X direction
    score ++;
      
  }
  
  // top edge
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; // switch Y direction
     score ++; 
  }
  
  
  // paddle
  if (ballY > height-paddleHeight) { // past 'goal line'
    if (ballX > mouseX && ballX < mouseX + 75) { // within paddle
      ballSpeedY = ballSpeedY * -1; // switch Y direction
    ballSpeedY -= 3;
    ballSpeedX -= 3;
    } else { // end game
      textSize(25);
      text("GAME OVER!", 325, 200);
      noLoop();
          if(key == 's' || 'S'){
              loop;
              start();
          }
    }
  }
}
 
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}
 
void drawPaddle() {
  stroke(paddleColor); // color of paddle border
  strokeWeight(4); // border thickness of 4px
  
  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(mouseX, height-paddleHeight-4, 75, paddleHeight);
}
 
void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-255
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}
 
void keyPressed() {
  // changes ball/paddle to black/white
    if (key == 'b' || key == 'B') {
    fill(0);
  }
  if (key == 'w' || key == 'W') {
    fill(255);
  }
}

void start() {
//when 's' is clicked, the game will run
if (key == 's' || key == 'S')
    moveBall();      // ball moves in X and Y directions
    checkCollide();  // checks for collision with walls or paddle
    drawPaddle();    // re-draws paddle
    drawBall();      // re-draws ball 
    loop;
}

//will pause unti 's' is clicled to start again
void INDUTIAE(){
if (key == 'p' || key == 'P'){
    noLoop;  
    textSize(25);
    text("PAUSE", 350,150);
        
}
}
