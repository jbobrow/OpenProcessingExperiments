
//Christopher Kelvin Chan
//ckchan@andrew.cmu.edu
//Code written on 20 Sept 2012
//Homework Assignment 7: A Computer Game

//------------------------------------------------------------------------------------------------------------

//SETUP

float playerX, playerY, playerSize, playerSpeedX, playerSpeedY, enemyX, enemyY, enemySize, enemySpeedX, enemySpeedY;
int startTime, gameTime, deaths;
int gamePhase;

void setup ()
{
  size (1000, 500);
  smooth ();
  rectMode (CENTER);
  ellipseMode (CENTER);
  textAlign (CENTER);

  playerX = 100;
  playerY = height/2;
  playerSize = 30;
  playerSpeedX = 0;
  playerSpeedY = 0;

  enemyX = width-200;
  enemyY = height/3;
  enemySize = 100;
  enemySpeedX = random (-25, -15);
  enemySpeedY = random (-20, -15);

  gameTime = 30000; //amount of time you need to survive for
  startTime = 0;
  deaths = 0;

  gamePhase = 1;
}

void draw ()
{
  background (#FFFFFF);

  if (gamePhase == 1)
  {
    instructions1 ();
  }
  else if (gamePhase == 2)
  {
    instructions2 ();
  }
  else if (gamePhase == 3)
  {
    instructions3 ();
  }
  else if (gamePhase == 4)
  {
    player ();
    enemy ();
    collision ();
    timer ();
  }
  else if (gamePhase == 5)
  {
    results ();
  }
}

//------------------------------------------------------------------------------------------------------------

//INSTRUCTIONS

//survive

void instructions1 ()
{
  fill (#000000, 70);
  textSize (35);
  text ("arrows:move | x:stop", width/2, height/2-25);

  textSize (10);
  text ("[1]", width/2-20, height/2);
  fill (#000000, 30);
  text ("[2]", width/2, height/2);
  text ("[3]", width/2+20, height/2);

  fill (#000000, 60);
  textSize (10);
  text ("[space to play]", width/2, height/2+20);
}

//avoid the red circle

void instructions2 ()
{
  fill (#FFFFFF);
  noStroke ();
  rect (width/2, height/2, width, height);
  fill (#000000, 70);
  textSize (35);
  text ("avoid the red circle", width/2, height/2-25);

  textSize (10);
  text ("[2]", width/2, height/2);
  fill (#000000, 30);
  text ("[1]", width/2-20, height/2);
  text ("[3]", width/2+20, height/2);

  fill (#000000, 60);
  textSize (10);
  text ("[space to play]", width/2, height/2+20);
}

//stay away from the edges

void instructions3 ()
{
  fill (#FFFFFF);
  rect (width/2, height/2, width, height);
  fill (#000000, 70);
  textSize (35);
  text ("stay away from the edges", width/2, height/2-25);

  textSize (10);
  text ("[3]", width/2+20, height/2);
  fill (#000000, 30);
  text ("[1]", width/2-20, height/2);
  text ("[2]", width/2, height/2);

  fill (#000000, 60);
  textSize (10);
  text ("[space to play]", width/2, height/2+20);
}

//-----------------------------------------------------------------------------------------------------------

//GAME COMPONENTS

void timer ()
{
  fill (#000000, 50);
  text (( (gameTime) - millis())/1000 + startTime/1000, width/2, height/2);

  if (gamePhase == 4 && (((gameTime) - millis())/1000 + startTime/1000) < 0)
  {
    gamePhase = 5;
  }
}

void results()
{
  fill (#FFFFFF);
  rect (width/2, height/2, width, height);
  fill (#000000, 60);
  textSize (10);
  text ("# of deaths", width/2, height/2-40);
  textSize (35);
  text (deaths, width/2, height/2);
  textSize (10);
  text ("[space to play again]", width/2, height/2+20);
}

void player ()
{
  noStroke ();
  fill (#FFFFFF);
  rect (width/2, height/2, width, height);
  fill (#00CCFF, 80);
  ellipse (playerX, playerY, playerSize, playerSize);
  playerX = playerX + playerSpeedX;
  playerY = playerY + playerSpeedY;

  //wrapping 

  if (playerSpeedX > 0 && playerX+playerSize/2 > width)
  {
    playerX = 0 - playerSize/2;
    playerX = playerX + playerSpeedX;
    deaths += 1;
    fill (#FF0000, 40);
    rect (width/2, height/2, width, height);
  }
  else if (playerSpeedX < 0 && playerX-playerSize/2 < 0)
  {
    playerX = width + playerSize/2;
    playerX = playerX + playerSpeedX;
    deaths += 1;
    fill (#FF0000, 40);
    rect (width/2, height/2, width, height);
  }
  else if (playerSpeedY > 0 && playerY+playerSize/2 > height)
  {
    playerY = 0 -playerSize/2;
    playerY = playerY + playerSpeedY;
    deaths += 1;
    fill (#FF0000, 40);
    rect (width/2, height/2, width, height);
  }
  else if (playerSpeedY < 0 && playerY-playerSize/2 < 0)
  {
    playerY = height + playerSize/2;
    playerY = playerY + playerSpeedY;
    deaths += 1;
    fill (#FF0000, 40);
    rect (width/2, height/2, width, height);
  }
}

void enemy()
{

  fill (#FF8800, 80);
  ellipse (enemyX, enemyY, enemySize, enemySize);
  enemyX = enemyX + enemySpeedX;
  enemyY = enemyY + enemySpeedY;  

  //bouncing

  if (enemySpeedX > 0 && enemyX+enemySize/2 > width)
  {
    enemySpeedX = enemySpeedX*-1;
  }
  else if (enemySpeedX < 0 && enemyX-enemySize/2 < 0)
  {
    enemySpeedX = enemySpeedX*-1;
  }
  else if (enemySpeedY > 0 && enemyY+enemySize/2 > height)
  {
    enemySpeedY = enemySpeedY*-1;
  }
  else if (enemySpeedY < 0 && enemyY-enemySize/2 < 0)
  {
    enemySpeedY = enemySpeedY*-1;
  }
}

void collision ()
{
  float d = dist (playerX, playerY, enemyX, enemyY);
  if (d < (playerSize+enemySize)/2)
  {
    fill (#FF0000, 40);
    rect (width/2, height/2, width, height);

    enemyX = random (enemySize/2, width-enemySize/2);
    enemyY = random (enemySize/2, height-enemySize/2);
    enemySpeedX = random (-25, 15);
    enemySpeedY = random (-15, 5);
    deaths += 1;
  }
}

void keyPressed ()
{  
  if (keyCode == RIGHT)
  {
    playerSpeedX = playerSpeedX+1;
  }
  else if (keyCode == LEFT)
  {
    playerSpeedX = playerSpeedX-1;
  }
  else if (keyCode == DOWN)
  {
    playerSpeedY = playerSpeedY+1;
  }
  else if (keyCode == UP)
  {
    playerSpeedY = playerSpeedY-1;
  }
  else if (key == 'x')
  {
    playerSpeedX = 0;
    playerSpeedY = 0;
  }

  else if (gamePhase == 2 && key == '1'|| gamePhase == 3 && key == '1')
  {
    gamePhase = 1;
  }
  else if (gamePhase == 1 && key == '2'|| gamePhase == 3 && key == '2')
  {
    gamePhase = 2;
  } 
  else if (gamePhase == 1 && key == '3'|| gamePhase == 2 && key == '3')
  {
    gamePhase = 3;
  }
  else if (gamePhase == 1 && key == ' ' || gamePhase == 2 && key == ' ' || gamePhase == 3 && key == ' ')
  {
    gamePhase = 4;
    startTime = millis ();
  }
  else if (gamePhase == 5 && key == ' ')
  {
    gamePhase = 1;
    deaths = 0;

    playerX = 100;
    playerY = height/2;
    playerSize = 30;
    playerSpeedX = 0;
    playerSpeedY = 0;

    enemyX = width-200;
    enemyY = height/3;
    enemySize = 100;
    enemySpeedX = -20;
    enemySpeedY = -10;
  }
}


