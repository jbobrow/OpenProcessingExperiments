
/*
  SumoBot Simulation Program
  An environment for SumoBot combat simulation.
  Version 00: 14.10.19
  Draws the Dohyo
  Draws a SumoBot attached to the mouse pointer.
  The SumoBot cannot move outside the Dohyo.
  Version 01: 14.10.19
  If the SumoBot moves out of the Dohyo its fill color changes to red.
  Version 02: 14.10.19
  The SumoBot class is introduced.
  Two bots included, one following the mouse, the other with random movements.
  The controlled bot cannot exit the Dohyo; the other changes color when out the Dohyo.

*/

// Declaration of global variables:
// scale of dwg: 5 pixels = 1 cm
int dohyo_bor = 5*5; // 5 cm
int dohyo_dia = 154*5; // 154 cm diam
int board_size = 900;
int dohyo_X = board_size/2;
int dohyo_Y = board_size/2;

// Declaration of Objects:
SumoBot bot1; // mouse driven
SumoBot bot2; // random driven

void setup() 
{
  frameRate(30);
  
  size(board_size, board_size); //800*800 pixels
  smooth();
  rectMode(CENTER);
  
  // Object initialization:
  bot1 = new SumoBot(color(0,250,0),mouseX,mouseY,0,0);
  bot2 = new SumoBot(color(0,255,255),board_size/2,board_size/2,0,0);
  
}

void draw() 
{
  // Declaration of variables: 
  float dist_bot1; // distance of the bot to the center of the Dohyo
  float dist_bot2;
  
  dohyo(); // draws the Dohyo
  
  bot1.move(mouseX, mouseY);
  dist_bot1=dist(bot1.bot_X, bot1.bot_Y,dohyo_X,dohyo_Y);  // distance from the bot to the center of the Dohyo
  if (dist_bot1>0)
  {
    bot1.bot_X=dohyo_X+(mouseX-dohyo_X)*min(1,(dohyo_dia/2)/dist_bot1);
    bot1.bot_Y=dohyo_Y+(mouseY-dohyo_Y)*min(1,(dohyo_dia/2)/dist_bot1);
  }  
  else
  {
    bot1.bot_X=mouseX;
    bot1.bot_Y=mouseY;
  }
  bot1.display();
  
  bot2.move(bot2.bot_X+random(-10,10),bot2.bot_Y+random(-10,10));
  dist_bot2=dist(bot2.bot_X, bot2.bot_Y,dohyo_X,dohyo_Y);  // distance from the bot to the center of the Dohyo
  if (dist_bot2>dohyo_dia/2)
    bot2.bot_C = color(255,0,0);  // if the bot is outside the Dohyo, fill it in red
  else
    bot2.bot_C = color(0,255,255);  
  bot2.display();  
  

}

void dohyo()
{
  // draw the Dohyo:
  background(255);
  fill(0);
  ellipse (board_size/2,board_size/2,dohyo_dia,dohyo_dia);
  fill(255);
  ellipse (board_size/2,board_size/2,dohyo_dia-dohyo_bor*2,dohyo_dia-dohyo_bor*2);

  // draw the Shikiri lines:
  fill(100);
  rect(board_size/2-10*5,board_size/2,2*5,20*5);
  rect(board_size/2+10*5,board_size/2,2*5,20*5);
}

class SumoBot
{
  int bot_size;  // side dimensions
  color bot_C;   // color
  float bot_X;   // coordinates of the bot center
  float bot_Y; 
  float bot_A;   // orientation of the bot
  float bot_S;   // speed of the bot

  // Constructor:
  SumoBot(color tempC, float tempX, float tempY, float tempA, float tempS)
  {
    bot_size = 20*5; // 20 cm
    bot_C = tempC;
    bot_X = tempX;
    bot_Y = tempY; 
    bot_A = tempA;
    bot_S = tempS;
  }

  void display()
  {
     fill(bot_C);
     rect(bot_X,bot_Y,bot_size,bot_size); 
  }

  void move(float tempX, float tempY)
  {
    bot_X = tempX;
    bot_Y = tempY;  
  }

}

