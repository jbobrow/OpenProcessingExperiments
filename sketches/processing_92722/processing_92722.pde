
// © Laura Tjho
// 60-257 Hw Assignment 7: Game

float x, y, wd, ht;
float randx, randy, randa, randb;
float speed, xspeed, yspeed; 
float a, b, aspeed, bspeed;
float ball;
int score, count, phase, time, countdown, startTime, gameTime, gameOver;


void setup()
{
  size(400,400);
  smooth();
  frameRate(120);
  
  phase = 0;
  gameTime = millis();
  count = 0;
  score = 0;
  
  x = width * .5;
  y = height * .5; 
  wd = width * .5;
  ht = height * .5;
  
  a = width * .2;
  b = height * .2;
  
  randx = random ( x);
  randy = random ( y);
  randa = random ( a);
  randb = random ( b);
  
  xspeed = 1;
  yspeed = 1;
   
  aspeed = .5;
  bspeed = .5;
}

void draw()
{
  background (0);
  
  if (phase == 0)
  {
    howTo();
  }
  else if (phase == 1)
  {
    bounceBlue();
    bounceOrange();
    instFeedback();
    gameTime();
  }
  else if (phase == 2)
  {
    gameOver();
  }
}

//INSTRUCTIONS
void howTo()
{
  phase = 0;
  
  textAlign(CENTER);
  textSize(10);
  text("click the blue ball for a surprise", x, y);
  text("press the space bar to continue", x, y+20);
}

//START GAME
void keyPressed()
{
  if (key == ' ')
  {
    if (phase == 0)
    {
      phase = 1;
      startTime = second();
      score = 0;
    }
    else if (phase == 2)
    {
      phase = 0;
    }
  }
}

//MOVE BLUE BALL
void bounceBlue()
{
  noStroke();
  fill( 0, 236, 255);
  ellipse (x, y, wd * .2, ht * .2);
  
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > 2 * wd) & (y> 2 * ht))
  {
    x=randx + 5;
    y=randy + 2;
    xspeed = -xspeed;
    yspeed = -yspeed;
  }
  
  else if ((x < 0) & (y < ht*.1))
  {
    x=randx + 10;
    y=randy;
    xspeed = -xspeed;
    yspeed = -yspeed + .2;
  } 
}

//BLUE BALL RESPONSE
void mousePressed ()
{
  //ellipse(x, y, wd * .2, ht * .2);
  x = mouseX;
  y = mouseY;
  
  if ((mouseX == x) || ( mouseY == y))
  {
    background(255);
    fill( 0, 236, 255);
    ellipse (x+30, y, wd * .05, ht * .05);
    ellipse (x-30, y, wd * .05, ht * .05);
    ellipse (x+30, y+15, wd * .05, ht * .05);
    ellipse (x-30, y-15, wd * .05, ht * .05);
    ellipse (x, y+30, wd * .05, ht * .05);
    ellipse (x, y-30, wd * .05, ht * .05);
    ellipse (x-15, y+30, wd * .05, ht * .05);
    ellipse (x+15, y-30, wd * .05, ht * .05);
    
    score = score + 1;
  }
}

//SHOWS SCORE
void instFeedback()
{
  textAlign(CENTER);
  textSize(20);
  text (int(score), wd, ht);

  if ((mouseX == x) || ( mouseY == y))
  {
    text (int(score), width * .1, height * .1);
  }
}

//MOVE ORANGE BALL
void bounceOrange()
{
  noStroke();
  fill(255, 112, 64);
  ellipse(a*2, b, wd * .3, ht * .3);
  
  a = a + aspeed;
  b = b + bspeed;
  
  if ((a > width) || (a< 0))
  {
    a=randa + 3;
    b=randb + 20;
    aspeed = -aspeed;
    bspeed = -bspeed + .5;
  }
  
  if ((b < 0) || (b > height))
  {
    a=randa + 2;
    b=randb + 10;
    aspeed = -aspeed;
    bspeed = -bspeed;
  }
}

//SHOW TIME ELAPSED
void gameTime()
{
  gameTime = 30000;
  time = gameTime/1000;
  countdown = gameTime/1000 - ( (millis() - startTime) ) / 1000;
  textSize (15);
  text("time elapsed", wd*.3, ht*.2);
  text(countdown, wd*.6, ht*.2);
  

  if (countdown <= 0)
  {
    phase = 2;
  }
}

void gameOver()
{
  if (gameTime >= 30000)
  {
    phase = 2;
    background(41, 255, 235);
    textAlign(CENTER);
    textSize(10);
    text("GAME OVER", wd, ht);
    text("Press the space bar to start over", wd, ht+25);
  }
  
  if (keyPressed == true)
  {
    phase = 0;
    howTo();
  }
}


