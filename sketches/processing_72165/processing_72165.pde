
import ddf.minim.*;
import ddf.minim.effects.*;
PImage bg;
Minim minim;
AudioPlayer groove;
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
int num = 20;
float mx[] = new float[num];
float my[] = new float[num];

// happens only once
void setup()
{
  size(800, 571, P2D);
  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3");
  groove.loop();
  bg = loadImage("background.jpg");
  smooth();
}

// happens over & over
void draw()
{
  background(bg);
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;

  for (int i = 0; i < num; i++) {
// which+1 is the smallest (the oldest in the array)
  int index = (which+1 + i) % num;
  ellipse(mx[index], my[index], i, i);
  }
  rect(20, mouseY, 20, 100);
  rect(760, somethingY, 20, 100);
  fill(mouseX, mouseY, RGB);
  ellipse(ballX, ballY, ballSz, ballSz);

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;

  somethingY = somethingY + somethingSpeed;

  // ball collision with top/bottom walls
  if ((ballY > height - ballSz/2) || (ballY <  ballSz/2)) {
    ySpeed = ySpeed * -1;
  }

  //ball collision with paddles
  if ((ballX < 40 + ballSz/2) && (ballY > mouseY && ballY < mouseY + 70)) {
    xSpeed = xSpeed * -1;
  }
  if ((ballX > width - 65 - ballSz/2) && (ballY > somethingY && ballY <somethingY + 70)) {
    xSpeed = xSpeed * -1;
  }

  // computer moving
  if (somethingY < -50 || somethingY > 550) {
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
  text(playerScore,250,500);
  text(" - ",400,500);
  text(computerScore,550,500);
  //title
  PFont font;
  font = loadFont("AgencyFB-Reg-48.vlw"); 
  textFont(font, 32); 
  text("                                            Let's play the ball game~", 15, 50);
}


