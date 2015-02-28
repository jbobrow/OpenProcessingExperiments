
/*@pjs preload="paddle.png","meteor.gif","space.jpg","loser.jpg","winner.jpg","intro.jpg"; */
float ballX;
float ballY;
float ballD = 1.7;
float ballS = 60;  // Radius
float dy = 0;  // Direction

float PX = 675;
float PW = 20;
float PH = 95;

float timer = 30;
int destcount = 3;
int gamestate = 0;
int MENU_STATE = 0;
int PLAY_STATE = 1;
int WIN_STATE = 2;
int LOSE_STATE = 3;
int lossreturn = 0;
int winreturn = 0;

int clicker = 0;

PImage space;
PImage meteor;
PImage paddle;
PImage losescreen;
PImage winscreen;
PImage introscreen;

void setup() 
{
  size(700, 500); 
  noStroke();
  imageMode(CENTER);
  
  ballY = height/2;
  ballX = 1;
  
  paddle = loadImage("paddle.png");
  meteor = loadImage("meteor.gif");
  space = loadImage("space.jpg");
  losescreen = loadImage("loser.jpg");
  winscreen = loadImage("winner.jpg");
  introscreen = loadImage("intro.jpg");
}

void draw() 
{
  if (gamestate == MENU_STATE)
  {
    background(0);
    image(introscreen, 350, 250, width, height);
    
    if (mousePressed == true)
    {
      clicker += 1;
    }
    
    if (clicker == 1)
    {
      gamestate = PLAY_STATE;
    }
  }
  
  if (gamestate == PLAY_STATE)
  {
    background(0); 
    if (ballX > width+ballS)
    {
      ballX = -width/2 - ballS;
      ballY = random(0, height);
      dy = 0;
      destcount -= 1;
      tint(255, 0, 0);
    }
    
    float pDist = dist(ballX, ballY, PX, mouseY);
    if (pDist < 38)
    {
      ballX = -width/2 - ballS;
      ballY = random(0, height);
      dy = 0;
      tint(0, 255, 0);
    }
    
    image(space, 350, 250, width, height);
    noTint();
    
    ballX += ballD * 10;
    ballY += dy;
    timer = timer - (1.0 / 60.0);
    

    if(ballY < ballS && ballD == -1) 
    {
      ballD *= -1;
    }
    
    if (timer < 0)
    {
      if (destcount > 0)
      {
        gamestate = WIN_STATE;
      }
    }
    
    if (destcount <= 0)
    {
      gamestate = LOSE_STATE;
    }
    
    fill(255);
    textSize(20);
    text("TIME: " + (int)timer, 0, 25);
    text("MISSES: " + (int)destcount, 0, 50);
    image(meteor, ballX, ballY, ballS, ballS);
    image(paddle, PX, mouseY, PW, PH);
  }
  
  if (gamestate == WIN_STATE)
  {
   background(0);
   image(winscreen, 350, 250, width, height);
  }
  
  if (gamestate == LOSE_STATE)
  {
    background(0);
    image(losescreen, 350, 250, width, height);
  }
}

