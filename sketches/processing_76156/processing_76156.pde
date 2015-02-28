
PImage Rainground;

float radius1 = 50;
float pos = 0;
float enemy = 0;
float enemyposX = 0;
float enemyposY = 0;
float goalpos = 0;
float playerPosX = 500;
float playerPosY = 500;
float pSize = 0;
float dirX =4;
float dirY = 1;
PFont font;
int score = 0;

int RAINDROPS = 1;

float lineX1 = 33;
float lineY1 = 0;
float lineX2 = 33;
float lineY2 = 40;

float lineXa1 = 36;
float lineYa1 = 0;
float lineXa2 = 36;
float lineYa2 = 43;

float lineXb1 = 39;
float lineYb1 = 0;
float lineXb2 = 39;
float lineYb2 = 46;

float lineXc1 = 42;
float lineYc1 = 0;
float lineXc2 = 42;
float lineYc2 = 49;


float lineXd1 = 45;
float lineYd1 = 0;
float lineXd2 = 45;
float lineYd2 = 51;

float lineXe1 = 48;
float lineYe1 = 0;
float lineXe2 = 48;
float lineYe2 = 54;

float lineXf1 = 51;
float lineYf1 = 0;
float lineXf2 = 51;
float lineYf2 = 57;

float lineXg1 = 54;
float lineYg1 = 0;
float lineXg2 = 54;
float lineYg2 = 60;

boolean trigger = false;
/*

 */


void setup()
{
  size(1000, 600);
  smooth();
  
  font = createFont("Arial",20);
  Rainground = loadImage("rainstorm2.png");
}

void draw()
{
  background(Rainground);
  noStroke();
  fill(170, 20, 250);
  ellipse(playerPosX, playerPosY, radius1, radius1); //player

  fill(255);
  text("Score: "+score, 800, 20);
  
  lineEnemy();
  checkCollision();
  
  /*
  enemyposX += dirX; //ENEMY MOVEMENT
  enemyposY += dirY;
  
  if(enemyposX >= 1000)
  {
    dirX = -dirX;
  }
   if(enemyposX <= 0)
  {
    dirX = -dirX;
  }
  
  if(enemyposY >= 600)
  {
    dirY = -dirY;
  }
   if(enemyposY <= 0)
  {
    dirY = -dirY;
  }
  */
  
  if ((keyPressed = true) && (key == 'a'))  //PLAYER MOVEMENT
  {
    playerPosX += -5;
  }
  
  if ((keyPressed = true) && (key == 'd'))  //PLAYER MOVEMENT
  {
    playerPosX += 5;
  }
  
  if(lineY1>= playerPosY)
  {
    if(trigger == false)
  {
    RAINDROPS += 1;
    score += 1;
    trigger = true;
  }
  } 
else
{
  trigger = false;
}

}



 /* void mouseClicked()
  {
    if(mouseX < playerPosX+radius1 && mouseX > playerPosX-radius1)
    {
      if(mouseY < playerPosY+radius1 && mouseY > playerPosY-radius1)
       {
      playerPosX = random(1000);
      playerPosY = random(600);
    }
    }
  }
  */
  void lineEnemy() //IMPORTANT AS HEL
  {
    strokeWeight(10);
    stroke(40,110, 190);
    line(lineX1, lineY1, lineX2, lineY2);
        line(lineXa1, lineYa1, lineXa2, lineYa2);
            line(lineXb1, lineYb1, lineXb2, lineYb2);
                line(lineXc1, lineYc1, lineXc2, lineYc2);
    lineY1 += 3;
    lineY2 += 3;
    
    lineYa1 += 3;
    lineYa2 += 3;
    
    lineYb1 += 3;
    lineYb2 += 3;
    
    lineYc1 += 3;
    lineYc2 += 3;
    if(lineY1>= 600 || lineYa1>= 600 || lineYb1>= 600 || lineYc1>= 600)
    {
      lineX1 = random(1000);
      lineY1 = 0;
      lineX2 = lineX1;
      lineY2 = 80;
      
         lineXa1 = random(1000);
      lineYa1 = 0;
      lineXa2 = lineXa1;
      lineYa2 = 80;
      
         lineXb1 = random(1000);
      lineYb1 = 0;
      lineXb2 = lineXb1;
      lineYb2 = 80;
      
         lineXc1 = random(1000);
      lineYc1 = 0;
      lineXc2 = lineXc1;
      lineYc2 = 80;
    }
    
    if(score>=5)
    {
       line(lineXd1, lineYd1, lineXd2, lineYd2);
        line(lineXe1, lineYe1, lineXe2, lineYe2);
            line(lineXf1, lineYf1, lineXf2, lineYf2);
                line(lineXg1, lineYg1, lineXg2, lineYg2);
    lineYd1 += 3;
    lineYd2 += 3;
    
    lineYe1 += 3;
    lineYe2 += 3;
    
    lineYf1 += 3;
    lineYf2 += 3;
    
    lineYg1 += 3;
    lineYg2 += 3;
                
      if(lineYd1>= 600 || lineYe1>= 600 || lineYf1>= 600 || lineYg1>= 600)
{      
          lineXd1 = random(1000);
      lineYd1 = 0;
      lineXd2 = lineXd1;
      lineYd2 = 80;
      
         lineXe1 = random(1000);
      lineYe1 = 0;
      lineXe2 = lineXe1;
      lineYe2 = 80;
      
         lineXf1 = random(1000);
      lineYf1 = 0;
      lineXf2 = lineXf1;
      lineYf2 = 80;
      
         lineXg1 = random(1000);
      lineYg1 = 0;
      lineXg2 = lineXg1;
      lineYg2 = 80;
    }
  }
  }
  
  void checkCollision()
  {
    if(playerPosX < -45 || playerPosX > 1045)
    {
      playerPosX = 500;
    }
    
  }
  
  
  
  
  
  /*CODE TO PUT in
  
  GAME LAYOUT
  
  1) Shots going left and right to dodge
  2)Put in Movement for player (Shrink to dodge easier when objectives are collected)
  3) Have more obstacles appear on screeen
  4)
  
  
  
  */

