
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
  Version 03: 14.10.19
  Rotation of the bot1 is introduced by means of the right/left mouse buttons.

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
  
  size(board_size, board_size);
  smooth();
  rectMode(CENTER);
  
  // Object initialization:
  bot1 = new SumoBot(color(0,250,0),mouseX,mouseY,0,0);
  bot2 = new SumoBot(color(0,255,255),board_size/2-130,board_size/2+40,0,0);
  
} // end of function setup

void draw() 
{
  // Declaration of variables: 
  float dist_bot1; // distance of the bot to the center of the Dohyo
  float dist_bot2;
  
  dohyo(); // draws the Dohyo
  
  // bot1:
  bot1.move(mouseX, mouseY);
  bot1.limit1(mouseX,mouseY);
  bot1.display1();
  
  // bot2:
  bot2.move(bot2.bot_X+random(-10,10),bot2.bot_Y+random(-10,10));
  bot2.limit2();
  bot2.display2();  

} // end of function draw

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
} // end of function dohyo


class SumoBot
{
  int bot_size;  // side dimensions
  color bot_C;   // color
  float bot_X;   // coordinates of the bot center
  float bot_Y; 
  float bot_A;   // orientation
  float bot_S;   // speed

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

  // Class function move:
  void move(float tempX, float tempY)
  {
    bot_X = tempX;
    bot_Y = tempY;  
  }
  
  // Class function display1:
  // the mouse button rotates the bot
  void display1()
  {
    if (mousePressed && (mouseButton == LEFT)) 
    {
      bot_A += radians(5);
    } 
    else if (mousePressed && (mouseButton == RIGHT)) 
      {
        bot_A -= radians(5);
      }
    translate(bot_X,bot_Y);
    rotate(bot_A);
    fill(bot_C);
    rect(0,0,bot_size,bot_size);
    rotate(-bot_A);
    translate(-bot_X,-bot_Y);
  }

  // Class function display2:
  // no rotation of the bot
  void display2()
  {
    fill(bot_C);
    rect(bot_X,bot_Y,bot_size,bot_size);
  }

  // Class function limit1
  // If the center of the bot reaches the border of the Dohyo, then it cannot go further.
  void limit1(float tempX, float tempY)
  {
    float dist_bot=dist(bot_X, bot_Y,dohyo_X,dohyo_Y);  // distance from the bot to the center of the Dohyo
    if (dist_bot>0)
    {
      bot_X=dohyo_X+(mouseX-dohyo_X)*min(1,(dohyo_dia/2)/dist_bot);
      bot_Y=dohyo_Y+(mouseY-dohyo_Y)*min(1,(dohyo_dia/2)/dist_bot);
    }  
    else
    {
      bot_X=mouseX;
      bot_Y=mouseY;
    } 
  }

  // Class function limit2
  // If the center of the bot reaches the border of the Dohyo, then its fill color is changed
  void limit2()
  { 
    float dist_bot=dist(bot_X, bot_Y,dohyo_X,dohyo_Y);  // distance from the bot to the center of the Dohyo
    if (dist_bot>dohyo_dia/2)
      bot_C = color(255,0,0);  // if the bot is outside the Dohyo, fill it in red
    else
      bot_C = color(0,255,255);  
  }


} // end of Class SumoBot
