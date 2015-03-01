
/*
  SumoBot Simulation Program
  An environment for SumoBot combat simulation.
  Version 00: 14.10.19
  Draws the Dohyo
  Draws a SumoBot attached to the mouse pointer.
  The SumoBot cannot move outside the Dohyo.
  Version 01: 14.10.19
  If the SumoBot moves out of the Dohyo its fill color changes to red.

*/

// global variables
// scale of dwg: 5 pixels = 1 cm
int dohyo_bor = 5*5; // 5 cm
int dohyo_dia = 154*5; // 154 cm diam
int board_size = 900;
int dohyo_X = board_size/2;
int dohyo_Y = board_size/2;
int bot_size = 20*5; // 20 cm
float bot_X, bot_Y; // coordinates of the bot
float dist_bot; // distance of the bot to the center of the Dohyo

void setup() 
{
  size(board_size, board_size); //800*800 pixels
  smooth();
  rectMode(CENTER);
}

void draw() 
{
  dohyo();
  dist_bot=sqrt(sq(mouseX-dohyo_X)+sq(mouseY-dohyo_Y));
  if (dist_bot>dohyo_dia/2)
    fill(255,0,0);
  else
    fill(150);
  rect(mouseX,mouseY,bot_size,bot_size);

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
