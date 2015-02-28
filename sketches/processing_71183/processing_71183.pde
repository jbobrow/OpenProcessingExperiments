
float ballX = 125;
float ballY = 125;

float xSpeed = 4;
float ySpeed = 4;

float ballSz = 25;
float somethingY = 0;
float somethingSpeed = 3;

int playerScore = 0;
int computerScore = 0;
int win = 1;

// happens only once
void setup()
{
  size(600, 400);
  smooth();
}

// happens over & over
void draw()
{
  background(255, 255, 225);
  rect(20, mouseY, 20, 70);
  rect(560, somethingY, 20, 70);
  fill(mouseX,mouseY,RGB);
  ellipse(ballX, ballY, ballSz, ballSz);

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;

  somethingY = somethingY + somethingSpeed;

  // ball collision with top/bottom walls
  if ((ballY > height - ballSz/2) || (ballY <  ballSz/2)) {
    ySpeed = ySpeed * -1;
  }
  
  //ball collision with paddles
  if((ballX < 40 + ballSz/2) && (ballY > mouseY && ballY < mouseY + 70)) {
    xSpeed = xSpeed * -1;
  }
  if((ballX > width - 65 - ballSz/2) && (ballY > somethingY && ballY <somethingY + 70)){
    xSpeed = xSpeed * -1;
  }
    
  // computer moving
  if (somethingY < -50 || somethingY > 400) {
    somethingSpeed = somethingSpeed * -1;
  }
  
  // when player scores 
  if (ballX > width) {
    playerScore = playerScore + win;
    ballX = width/2;
    ballY = height/2;
    xSpeed = xSpeed * -1;
  }
    
  // when computer scores 
  if (ballX < 0) {
    computerScore = computerScore + win;
    ballX = width/2;
    ballY = height/2;
    xSpeed = xSpeed * -1;
  }
  //scores
  print(playerScore);
  print(" - ");
  println(computerScore);
 
  //title
  PFont font;
  font = loadFont("AgencyFB-Reg-48.vlw"); 
  textFont(font, 32); 
  text("                           Let's play the ball game~", 15, 50);
}

