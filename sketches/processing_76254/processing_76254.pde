
PImage Rainground;
int level = 1;
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
float lineY2 = 20;

float lineXa1 = 36;
float lineYa1 = 0;
float lineXa2 = 36;
float lineYa2 = 20;

float lineXb1 = 39;
float lineYb1 = 0;
float lineXb2 = 39;
float lineYb2 = 20;

float lineXc1 = 42;
float lineYc1 = 0;
float lineXc2 = 42;
float lineYc2 = 20;


float lineXd1 = 45;
float lineYd1 = 0;
float lineXd2 = 45;
float lineYd2 = 20;

float lineXe1 = 48;
float lineYe1 = 0;
float lineXe2 = 48;
float lineYe2 = 20;

float lineXf1 = 51;
float lineYf1 = 0;
float lineXf2 = 51;
float lineYf2 = 20;

float lineXg1 = 54;
float lineYg1 = 0;
float lineXg2 = 54;
float lineYg2 = 20;

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
  if(level == 1)
  {
  background(Rainground);
  noStroke();
  fill(170, 20, 250);
  ellipse(playerPosX, playerPosY, radius1, radius1); //player

  fill(255);
  text("Score: "+score, 800, 20);
  
  lineEnemy();
  checkCollision();
  
  if ((keyPressed = true) && (key == 'a'))  //PLAYER MOVEMENT
  {
    playerPosX += -5;
  }
  
  if ((keyPressed = true) && (key == 'd'))  //PLAYER MOVEMENT
  {
    playerPosX += 5;
  }
  
  if(lineY1>= playerPosY || lineYd1>= playerPosY)
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
//CHECK THIS IF STATMENT FOR ME
if(lineY2 >= playerPosY && lineX2 < playerPosX+30 && lineX2 > playerPosX-30 ||
lineYa2 >= playerPosY && lineXa2 < playerPosX+30 && lineXa2 > playerPosX-30 ||
lineYb2 >= playerPosY && lineXb2 < playerPosX+30 && lineXb2 > playerPosX-30 ||
lineYc2 >= playerPosY && lineXc2 < playerPosX+30 && lineXc2 > playerPosX-30 ||
lineYd2 >= playerPosY && lineXd2 < playerPosX+30 && lineXd2 > playerPosX-30 ||
lineYe2 >= playerPosY && lineXe2 < playerPosX+30 && lineXe2 > playerPosX-30 ||
lineYf2 >= playerPosY && lineXf2 < playerPosX+30 && lineXf2 > playerPosX-30 ||
lineYg2 >= playerPosY && lineXg2 < playerPosX+30 && lineXg2 > playerPosX-30)
    {
      level++;
    }

  if(level == 2)//end game
  {
    fill(250,20,20);
    rect(0,0, 1000,1000);
  }
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
    lineY1 += 4;
    lineY2 += 4;
    
    lineYa1 += 4;
    lineYa2 += 4;
    
    lineYb1 += 4;
    lineYb2 += 4;
    
    lineYc1 += 4;
    lineYc2 += 4;
    if(lineY1>= 504 || lineYa1>= 504 || lineYb1>= 504 || lineYc1>= 504)
    {
      lineX1 = random(1000);
      lineY1 = 0;
      lineX2 = lineX1;
      lineY2 = 20;
      
         lineXa1 = random(1000);
      lineYa1 = 0;
      lineXa2 = lineXa1;
      lineYa2 = 20;
      
         lineXb1 = random(1000);
      lineYb1 = 0;
      lineXb2 = lineXb1;
      lineYb2 = 20;
      
         lineXc1 = random(1000);
      lineYc1 = 0;
      lineXc2 = lineXc1;
      lineYc2 = 20;
    }
    
    if(score>=5)
    {
       line(lineXd1, lineYd1, lineXd2, lineYd2);
        line(lineXe1, lineYe1, lineXe2, lineYe2);
            line(lineXf1, lineYf1, lineXf2, lineYf2);
                line(lineXg1, lineYg1, lineXg2, lineYg2);
    lineYd1 += 4;
    lineYd2 += 4;
    
    lineYe1 += 4;
    lineYe2 += 4;
    
    lineYf1 += 4;
    lineYf2 += 4;
    
    lineYg1 += 4;
    lineYg2 += 4;
                
      if(lineYd1>= 504 || lineYe1>= 504 || lineYf1>= 504 || lineYg1>= 504)
{      
          lineXd1 = random(1000);
      lineYd1 = 0;
      lineXd2 = lineXd1;
      lineYd2 = 20;
      
         lineXe1 = random(1000);
      lineYe1 = 0;
      lineXe2 = lineXe1;
      lineYe2 = 20;
      
         lineXf1 = random(1000);
      lineYf1 = 0;
      lineXf2 = lineXf1;
      lineYf2 = 20;
      
         lineXg1 = random(1000);
      lineYg1 = 0;
      lineXg2 = lineXg1;
      lineYg2 = 20;
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

