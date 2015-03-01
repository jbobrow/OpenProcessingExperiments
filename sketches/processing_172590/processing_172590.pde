
int ballX;
int ballY;
float ballSpeedX = 5;
float ballSpeedY = 5;
int paddleHeight = 30;
int paddleColor;
boolean running = false;



void setup() {
  size(800, 600);
  noCursor();
  ballX = width/2; //ball starting place
  ballY = height/2;
}

void draw() {
  background(128);
  moveBall();  
  checkCollide(); //run when ball collides with wall || paddle
  drawPaddle(); //creates paddle 
  drawBall(); //creates ball
 
  
  
}

void moveBall() {
 ballX = ballX + ballSpeedX;
 ballY = ballY + ballSpeedY;
 ballSpeedX = ballSpeedX + .5;
 ballSpeedY = ballSpeedY + .5;
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); //print what the ball speed 
}                               // X && Y coordinates are at the time

void checkCollide() {

   if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1;  
          
       }
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1;
       
        }
  if (ballY > height-paddleHeight) {                //If ballY is less than the goal line
    if (ballX > mouseX && ballX < mouseX + 200) {       //the paddle height than change
      ballSpeedY = ballSpeedY * -1;             // value and go opposite way 
      ballY= ballSpeedY+ ballY;
      ballX= ballSpeedX+ ballX;
    } else {                            // only if touching the paddle
      text("GAME OVER!", width/2, height/2);            // else if not touching paddle print
      noLoop();                         // Ã¢ï¿½ï¿½Game OverÃ¢ï¿½ï¿½
    }
  }
}

void drawBall() {
  noStroke();               //no stroke / outline created by the ball
  ellipse(ballX, ballY, 20, 20);        //size and demensions of the ball
}

void drawPaddle() {
  stroke(paddleColor);
  strokeWeight(4);                          //outline of paddle
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);       //draws paddle
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));      //if mouse pressed change the outline 
}                                // of the paddle according to where it
                              

