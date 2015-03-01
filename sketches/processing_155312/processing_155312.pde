
//jack lance
//copyright
import java.io.*;
import java.util.*;
FloatList inventory;
int numBalls;
float dt = .5;
ball[] ballArray;
int startPosX;
int startPosY = 10;
int levelBalls[] = {0,5,10,15,20,25,30};
int colorBalls[][] = {{0,0,0},{100,0,0},{100,100,0},{100,100,100},{150,30,76},{40,140,75},{0,150,75}};
int numLevels = levelBalls.length - 1;
int ballsLeft;
int currentLevel = 1;
boolean keyUp;
boolean keyLeft;
boolean keyDown;
boolean keyRight;
boolean keyEnter; 
boolean keyCheat;
int score = 0;
int levelCount = 0;
int startTime;
boolean beginning = true;
//Scanner kbd = new Scanner (System.in);
collisionDetection collision = new collisionDetection();
player player1;
int runTime;
int levelStartTime;
void setup()
{
  size(700,700);
  startTime = millis();
  background(0);
  noStroke();
  frameRate(120);
  strokeWeight(10);
  rectMode(CENTER);
  numBalls = levelBalls[currentLevel];
  ballArray = new ball[levelBalls[numLevels]];
  ballsLeft = 5;
  addBalls();
  player1 = new player();
  player1.drawPlayer();
  textSize(100);
  textAlign(CENTER);
  levelStartTime = millis();
}
void draw()
{
  if (beginning)
  {
    beginningDisplay();
  }
  else
  {
    runTime = millis();
    if (runTime - levelStartTime > 1000 * (5 + 10 * currentLevel))
    {
      player1.lost = true;
      score += numBalls - ballsLeft;
    }
    background(0);
    fill(255);
    textSize(30);
    text("Time Left: ", 200,200);
    text((5 + 10 * currentLevel) - (runTime - levelStartTime)/1000, 200,300);
    player1.updatePlayerPosition(dt);
    for (int i=0;i<numBalls;i++)
    {
      ballArray[i].updatePosition(dt,i);
    }
    collision.collision();
    if (ballsLeft == 0)
    {
      levelCount ++;
      levelStartTime = millis();
    }
    nextLevel();
    if (player1.lost)
    {
      endGame(score);
    }
  }
}

void keyPressed() 
{
  if (key == 'p')
  {
    beginning = false;
  }  
  if (key == 'w') 
  {
    keyUp = true;
  } 
  if (key == 's') 
  {
    keyDown = true; 
  }
  if (key == 'a') 
  {
    keyLeft = true; 
  }
  if (key == 'd') 
  {
    keyRight = true; 
  }
  if (key == ENTER || key == RETURN)
  {
    keyEnter = true;
  }
  if (key == '*')
  {
    keyCheat = true;
  }
}    
void keyReleased()
{
  if (key == 'w')
  {
    keyUp = false;
  } 
    if (key == 's') 
  {
  keyDown = false; 
  }
  if (key == 'a') 
  {
    keyLeft = false; 
  }
  if (key == 'd') 
  {
    keyRight = false; 
  }
  if (key == ENTER || key == RETURN)
  {
    keyEnter = false;
    player1.single = false;
  }
  if (key == '*')
  {
    keyCheat = false;
  }
}  
void addBalls()
{
  for ( int i = 0; i<ballArray.length; i++)
  {
    startPosX = (i * 40 + 10)%width;
    if (startPosX == 10)
    {
      startPosY += 40;
    }
    ballArray[i] = new ball(startPosX,startPosY,colorBalls[(i+5)/5][0],colorBalls[(i+5)/5][1],colorBalls[(i+5)/5][2]);
    ballArray[i].drawBall(30);
    ballArray[i].attack = i >= 20;
    ballArray[i].inputVelocity(random(-2,2),random(-2,2));
  }
}
void endGame(int finalScore)
{
  textSize(50);
  background(0);
  text("CONGRATULATIONS!!", width/2, height/2 - 200);
  text("YOUR SCORE WAS", width/2, height/2);
  text(finalScore, width/2, height/2 + 200);
  noLoop();
}
void nextLevel()
{
  if (levelCount >= 1 && levelCount <= 500)
  {
    textSize(100);
    background(0);
    text("Level", width/2, height/2);
    text(currentLevel + 1, width/2, height/2 + 110);
  }
  else if (levelCount > 500)
  {
    currentLevel++;
    score += numBalls;
    levelStartTime = millis();
    if (numBalls == ballArray.length)
    {
      endGame(score);
    }
    for (int i = 0; i < numBalls; i++)
    {
      ballArray[i].hit = false;
      ballArray[i].hitUpdate = false;
    }
    numBalls = levelBalls[currentLevel];
    ballsLeft = numBalls;
    if (ballArray[numBalls-1].attack)
    {
      ballsLeft -= 5;
    }
    levelCount = 0;
    keyCheat = false;
    if (currentLevel == 7)
    {
      endGame(score);
    }
  }
}
    
void beginningDisplay()
{
    textSize(40);
    background(0);
    text("Welcome To Jack's Game", width/2, height/2 - 240);
    text("To move, use w, a, s, and d", width/2, height/2 - 180);
    text("To hit the balls, move ", width/2, height/2 - 120);
    text("over them and press enter", width/2, height/2 - 60);
    fill(40,140,75);
    text("Watch out for balls the ", width/2, height/2);
    text("same color as this text...", width/2, height/2 + 60);
    text("They will make you lose", width/2, height/2 + 120);
    text("Hit p to start", width/2, height/2 + 180);
    levelStartTime = millis();
}

class ball
{
  float ballX;
  float ballY;
  float ballDiameter;
  float ballXVelocity;
  float ballYVelocity;  
  float r;
  float g;
  float b;
  boolean hit = false;
  boolean hitUpdate = false;
  boolean[] currentlyColliding = new boolean[ballArray.length];
  boolean attack;
  ball(float inputBallX, float inputBallY,
        float inputR, float inputG, float inputB)
  {
    ballX = inputBallX;
    ballY = inputBallY;
    b = inputB;
    r = inputR;
    g = inputG;  
  }
  void drawBall(float inputBallDiameter)
  {
    ballDiameter = inputBallDiameter;
    fill(r,g,b);
    ellipse(ballX,ballY,ballDiameter,ballDiameter);
  }
  void inputVelocity(float inputBallXVelocity, float inputBallYVelocity)
  {
    ballXVelocity = inputBallXVelocity;
    ballYVelocity = inputBallYVelocity;
  }
  void updatePosition(float inputdt, int currentBall)
  {
    if (!hit)
    {
    if (ballX + ballDiameter/2 >= width || ballX - ballDiameter/2 <= 0)
    {
      ballXVelocity *= -1;
    }
    if (ballY + ballDiameter/2 >= height || ballY - ballDiameter/2 <= 0)
    {
      ballYVelocity *= -1;
    }
    ballX = (ballX + ballXVelocity*inputdt);
    ballY = (ballY + ballYVelocity*inputdt);
    fill(r,g,b);
    ellipse(ballX,ballY,ballDiameter,ballDiameter);
    }
  }
}


class collisionDetection
{
  void collision()
  {
    for (int i=0;i<numBalls;i++)
    {
     for (int j = i+1; j < numBalls;j++)
     {
       if (j < numBalls)
       {
         if (!ballArray[i].hit && !ballArray[j].hit)
         {
           if (dist(ballArray[i].ballX,ballArray[i].ballY,ballArray[j].ballX,ballArray[j].ballY) <= (ballArray[i].ballDiameter/2 + ballArray[j].ballDiameter/2))
           {
             if (ballArray[i].currentlyColliding[j] == false && ballArray[j].currentlyColliding[i] == false)
             {
               float theta = atan((ballArray[i].ballY -ballArray[j].ballY)/(ballArray[i].ballX -ballArray[j].ballX));
               float centerX = ballArray[j].ballDiameter/2 * cos(theta);
               float centerY = ballArray[j].ballDiameter/2 * sin(theta);
               float alpha = atan(ballArray[i].ballYVelocity/ballArray[i].ballXVelocity);
               float gamma = atan(ballArray[j].ballYVelocity/ballArray[j].ballXVelocity);
               float xtemp = ballArray[i].ballXVelocity;
               ballArray[i].ballXVelocity = cos(alpha + theta)*(ballArray[i].ballXVelocity-tan(alpha + theta) * ballArray[i].ballYVelocity);
               ballArray[i].ballYVelocity = cos(alpha + theta)*(xtemp * tan(alpha + theta) + ballArray[i].ballYVelocity);
               float x1temp = ballArray[j].ballXVelocity;
               ballArray[j].ballXVelocity = cos(alpha + gamma)*(ballArray[j].ballXVelocity-tan(alpha + gamma) * ballArray[j].ballYVelocity);
               ballArray[j].ballYVelocity = cos(alpha + gamma)*(xtemp * tan(alpha + gamma) + ballArray[j].ballYVelocity);
               float iXTemp = ballArray[i].ballXVelocity;
               float iYTemp = ballArray[i].ballYVelocity;
               float jXTemp = ballArray[j].ballXVelocity;
               float jYTemp = ballArray[j].ballYVelocity;
               ballArray[i].ballXVelocity = (iXTemp + jXTemp) * iXTemp / (iXTemp + jXTemp);
               ballArray[i].ballYVelocity = (iYTemp + jYTemp) * iYTemp / (iYTemp + jYTemp);
               ballArray[j].ballXVelocity = (iXTemp + jXTemp) * jXTemp / (iXTemp + jXTemp);
               ballArray[j].ballYVelocity = (iYTemp + jYTemp) * jYTemp / (iYTemp + jYTemp);
               ballArray[i].currentlyColliding[j] = true;
               ballArray[j].currentlyColliding[i] = true;
             }
           }
           else
           {
              ballArray[i].currentlyColliding[j] = false;
              ballArray[j].currentlyColliding[i] = false;
           }
         }
       }
     }
   }
  }
}
class player
{
  float playerX = width/2;
  float playerY = height/2;
  float velocityX;
  float velocityY;
  float deltaPlayerX = .1;
  float deltaPlayerY = .1;
  float maxVelocity = .5;
  int playerHeight = 50;
  int playerWidth = 50;
  boolean lost = false;
  boolean single = false;
  void drawPlayer()
  {
    stroke(255);
    line(playerX + playerWidth, playerY, playerX - playerWidth, playerY);
    line(playerX, playerY + playerHeight, playerX, playerY - playerHeight);
    noStroke();
  }
  void updatePlayerPosition(float inputdt)
  {
    float dt = inputdt;
    if (keyRight)
    {
      velocityX += deltaPlayerX;
    }
    if (keyLeft)
    {
      velocityX -= deltaPlayerX;
    }
    if (keyUp)
    {
      velocityY -= deltaPlayerY;
    }
    if (keyDown)
    {
      velocityY += deltaPlayerY;
    }
    if (keyEnter)
    {
      for (int i = 0; i < numBalls; i++)
      {
        if (abs(ballArray[i].ballX - playerX) < ballArray[i].ballDiameter/2)
        {
          
          if (abs(ballArray[i].ballY - playerY) < ballArray[i].ballDiameter/2)
          {
            if (!single)
            {
              ballArray[i].hit = true;
              if (!ballArray[i].hitUpdate)
              {
                ballsLeft --;
                ballArray[i].hitUpdate = true;
              }
            }
          }
        }
      }
      single = true;
    }
    if (keyCheat)
    {
      ballsLeft = 0;
    }
    if (!(keyRight || keyLeft))
    {
      if (velocityX <0)
      {
        if (velocityX > .04)
        {
          velocityX = 0;
        }
        else
        {
          velocityX += deltaPlayerX * .2;
        }
      }
      if (velocityX > 0)
      {
        if (velocityX < .04)
        {
          velocityX = 0;
        }
        else
        {
          velocityX -= deltaPlayerX * .2;
        }
      }
    }
    if (!(keyRight || keyLeft))
    {
      if (velocityY >0)
      {
        if (velocityY < .04)
        {
          velocityY = 0;
        }
        else
        {
          velocityY -= deltaPlayerY * .2;
        }
      }
      if (velocityY < 0)
      {
        if (velocityY > .04)
        {
          velocityX = 0;
        }
        else
        {
          velocityY += deltaPlayerY * .2;
        }
      }
    }
    playerX = (playerX + velocityX * dt + width) % width;
    playerY = (playerY + velocityY * dt + height) % height;
    for (int i = 0; i < numBalls; i++)
    {
      if (ballArray[i].attack)
      {
        if (abs(ballArray[i].ballX - playerX) < ballArray[i].ballDiameter/2)
        {
          if (abs(ballArray[i].ballY - playerY) < ballArray[i].ballDiameter/2)
          {
            score += numBalls - ballsLeft;
            lost = true;
          }
        }
      }
    }
    stroke(255);
    line((playerX + playerWidth), playerY, (playerX - playerWidth), playerY);
    line(playerX, (playerY + playerHeight), playerX, (playerY - playerHeight));
    noStroke();
  }
}



