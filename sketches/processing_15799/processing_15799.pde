
boolean upPressed, downPressed, leftPressed, rightPressed, enterPressed, rPressed;

//player
int x,y;
//goal
float u,w;
//mine1
float m,n;
//mine2
float a,b;
//mine3
float c,d;
//mine4
float e,f;
//mine5
float g,h;

int screenNumber;
int playerLives;
int speed;

void setup()
{
  size(800,600);
  smooth();
  noStroke();
  screenNumber = 0;
  x = 125;
  y = 125;
  u = 675;
  w = 125;
  m = width/2;
  n = height/5;
  a = width/4;
  b = height/4;
  c = width/18;
  d = height/3;
  e = width/7;
  f = height/9;
  g = width/5;
  h = height/11;
}

void draw()
{
  background(0);
  if (screenNumber == 0)
  {
    displayTitle();
    playerLives = 3;
  }
  else if (screenNumber == 1)
  {
    text("LEVEL 1",width,40);
    
    setSpeed();
    
    movePlayer();
    drawPlayer();
    
    checkGoal();
    drawGoal();
    
    checkMineTouch();
    drawMine();
    drawMine2();
    drawMine3();
    drawMine4();
    drawMine5();
    checkLose();
    setSpeed();
    displayLives();
  }
  else if (screenNumber == 2)
  {
    displayEnd();
  }
  else if (screenNumber == 3)
  {
    displayBadEnd();
  }
  /*else if (screenNumber == 4)
  {
    text("LEVEL 2",width,40);
    
    setSpeed();
    
    movePlayer();
    drawPlayer();
    
    checkGoal2();
    drawGoal();
    
    checkMineTouch();
    drawMine();
    drawMine2();
    checkLose();
    setSpeed();
    displayLives();
  }
  else if (screenNumber == 5)
  {
    text("LEVEL 3",width,40);
    
    setSpeed();
    
    movePlayer();
    drawPlayer();
    
    checkGoal3();
    drawGoal();
    
    checkMineTouch();
    drawMine();
    drawMine2();
    drawMine3();
    checkLose();
    setSpeed();
    displayLives();
    
  }
  else if (screenNumber == 6)
  {
    text("LEVEL 4",width,40);
    
    setSpeed();
    
    movePlayer();
    drawPlayer();
    
    checkGoal4();
    drawGoal();
    
    checkMineTouch();
    drawMine();
    drawMine2();
    drawMine3();
    drawMine4();
    checkLose();
    setSpeed();
    displayLives();
  }
  else if (screenNumber == 7)
  {
    text("LEVEL 5",width,40);
    
    setSpeed();
    
    movePlayer();
    drawPlayer();
    
    checkGoal5();
    drawGoal();
    
    checkMineTouch();
    drawMine();
    drawMine2();
    drawMine3();
    drawMine4();
    drawMine5();
    checkLose();
    setSpeed();
    displayLives();
    
  }*/
}

void keyPressed()
{
  if (keyCode == UP) upPressed = true;
  if (keyCode == LEFT) leftPressed = true;
  if (keyCode == DOWN) downPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == ENTER) enterPressed = true;
  if (key == 'r') rPressed = true;
}

void keyReleased()
{
  if (keyCode == UP) upPressed = false;
  if (keyCode == LEFT) leftPressed = false;
  if (keyCode == DOWN) downPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == ENTER) enterPressed = false;
  if (key == 'r') rPressed = false;
}

