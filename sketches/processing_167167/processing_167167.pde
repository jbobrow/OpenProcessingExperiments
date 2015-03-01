
/*
  SumoBot Simulation Program
  An environment for SumoBot combat simulation.
  By Ricardo Gonzalez-Haba - rigonz2@netscape.net
  Version 00: 14.10.19
  Draws the Dohyo.
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
  Version 04: 14.10.19
  Code split in parts - functions & classes
  Both bots follow random paths - no intervention of the mouse.
  Border detection introduced: 
  - whenever one of the corners is above the border line, there is a change of color.
  - when the center of the bot crosses the border line, the bot stops. 
  Start/Stop mouse-click interrupt introduced.
  Digital clock introduced (based on work by Serge J Desjardins aka techone / tech37).
  
*/

// Declaration of global variables:
// Dohyo related (scale of dwg: 5 pixels = 1 cm):
int board_size = 900; // 180 cm
int dohyo_dia = 154*5; // 154 cm diam
int dohyo_bor = 5*5; // 5 cm
int dohyo_X = board_size/2;
int dohyo_Y = board_size/2;

// Assorted control:
boolean startS = false;

// Clock:
int Ts0, Tm0, Th0; // seconds, minutes and hours - actual time
int Ts1, Tm1, Th1; // seconds, minutes and hours - remaining time
int Ts; // seconds since starting the competition

// Declaration of Objects:
// Bots:
SumoBot bot1;
SumoBot bot2; // random driven

// Fonts:
PFont font1, font2;

void setup() 
{
  // Board etc.
  size(board_size, board_size);
  smooth();
  rectMode(CENTER);
  frameRate(30);
  
  // Fonts:
  font1 = loadFont("ArialMT-48.vlw");
  font2 = loadFont("Impact-48.vlw");
  
  // Object initialization:
  bot1 = new SumoBot(color(0,255,0),board_size/2+190,board_size/2-80); // green, left
  bot2 = new SumoBot(color(0,0,255),board_size/2-170,board_size/2+40); // blue, right
   
  background(255);
  dohyo(); // draws the Dohyo
  bot1.display1();
  bot2.display1();
  
  
} // end of function setup

void draw() 
{
  // Declaration of variables: 

  if (startS == true)
  {  
    // Core of main program:
    background(255);
    dohyo(); // draws the Dohyo
    
    // Clock:
    Th0 = hour();
    Tm0 = minute();
    Ts0 = second();       
    digitalClock(-75,0,Th0,Tm0,Ts0);

    Ts = 3*60+(Th1-Th0)*3600+(Tm1-Tm0)*60+(Ts1-Ts0);
    digitalClock(-75+600,0,floor(Ts/3600),floor(Ts/60),Ts%60);
  
    // bot1:
    bot1.move1();
    bot1.limit1();
    bot1.display1();
    
    // bot2:
    bot2.move1();
    bot2.limit1();
    bot2.display1();
    
  }  // end if startS

} // end of function draw

// Function mouseClicked, for start/stop
void mouseClicked() 
{
  startS = !startS;
  Th1 = hour();
  Tm1 = minute();
  Ts1 = second();
}


class SumoBot
{
  int bot_size;  // side dimensions
  color bot_C;   // color, variable
  color bot_C0;  // color, fixed
  float bot_X;   // coordinates of the bot center
  float bot_Y; 
  float bot_A;   // orientation
  float bot_S;   // speed

  // Constructor:
  SumoBot(color tempC, float tempX, float tempY)
  {
    bot_size = 20*5; // 20 cm
    bot_C0 = tempC;
    bot_C = bot_C0;
    bot_X = tempX;
    bot_Y = tempY; 
    bot_A = 0;
    bot_S = 0;
  }

  // Class function move1:
  // Random movement.
  // Upon touching the border with a corner, it changes color to orange.
  // If the color is red (center of bot in the border), then it stops.
  void move1()
  {
    float tempX, tempY;
    float [] dist_C = new float[4]; // distance from the bot corners to the center of the Dohyo
    boolean CSensor = false;  // corner sensor
  
    if (bot_C == color(255,0,0)) // this comes from bot.limit1 = the center of the bot is on the border
    {
      tempX = 0;
      tempY = 0;
    }
    else
    {
      dist_C[0]=dist(bot_X-0.707*bot_size*cos(bot_A), bot_Y+0.707*bot_size*sin(bot_A),dohyo_X,dohyo_Y);     
      dist_C[1]=dist(bot_X-0.707*bot_size*cos(bot_A), bot_Y-0.707*bot_size*sin(bot_A),dohyo_X,dohyo_Y);
      dist_C[2]=dist(bot_X+0.707*bot_size*cos(bot_A), bot_Y-0.707*bot_size*sin(bot_A),dohyo_X,dohyo_Y);
      dist_C[3]=dist(bot_X+0.707*bot_size*cos(bot_A), bot_Y+0.707*bot_size*sin(bot_A),dohyo_X,dohyo_Y);
    
      int i=0;
      while (i<4 && !CSensor) // verification of the distance from the corners to the Dohyo center:
      {
        if (dist_C[i] >= (dohyo_dia/2-dohyo_bor))
          CSensor = true;
        i++;
      }
      
      if (!CSensor)
        bot_C=bot_C0; // if no corner is activated, return to original color
      else
        bot_C = color(255,150,0);  // change to orange
  
      tempX = random(-10,10);
      tempY = random(-10,10);
    }
    
    // in any case continue with the walk:
    bot_X += tempX;
    bot_Y += tempY;
  }

  // Class function move2:
//  void move2()
//  {
//    float tempX, tempY;
//    tempX = random(-10,10);
//    tempY = random(-10,10);
//    bot_X += tempX;
//    bot_Y += tempY;  
//  }

  // Class function limit1
  // If the center of the bot reaches the border of the Dohyo, then it changes its color to red.
  void limit1()
  {
    float dist_bot=dist(bot_X, bot_Y,dohyo_X,dohyo_Y);  // distance from the bot to the center of the Dohyo
    if (dist_bot > (dohyo_dia/2-dohyo_bor))
      bot_C=color(255,0,0);
  }

  // Class function limit2
  // If the center of the bot reaches the border of the Dohyo, then its fill color is changed
//  void limit2()
//  { 
//    float dist_bot=dist(bot_X, bot_Y,dohyo_X,dohyo_Y);  // distance from the bot to the center of the Dohyo
//    if (dist_bot>dohyo_dia/2)
//      bot_C = color(255,0,0);  // if the bot is outside the Dohyo, fill it in red
// 
//  }



  // Class function display1:
  // no rotation of the bot
  void display1()
  {
    fill(bot_C);
    rect(bot_X,bot_Y,bot_size,bot_size);
  }

  
  // Class function display1:
  // the mouse button rotates the bot
//  void display1()
//  {
//    if (mousePressed && (mouseButton == LEFT)) 
//    {
//      bot_A += radians(5);
//    } 
//    else if (mousePressed && (mouseButton == RIGHT)) 
//      {
//        bot_A -= radians(5);
//      }
//    translate(bot_X,bot_Y);
//    rotate(bot_A);
//    fill(bot_C);
//    rect(0,0,bot_size,bot_size);
//    rotate(-bot_A);
//    translate(-bot_X,-bot_Y);
//  }

  // Class function display2:
  // no rotation of the bot
  void display2()
  {
    fill(bot_C);
    rect(bot_X,bot_Y,bot_size,bot_size);
  }




} // end of Class SumoBot
// Function digitalClock
void digitalClock(int X, int Y, int Th, int Tm, int Ts)
{
  
  // Box:
  fill(255);
  strokeWeight(4);
  stroke(0,69,162);
  quad(X+100,Y+20,X+325,Y+20,X+325,Y+80,X+100,Y+80);

  // Dots inside the digital box
  for (int x1 = 175; x1 < 300; x1 += 75)
    for (int y1 = 40; y1 < 70; y1 += 20)
    {
      fill(255,145,0);
      noStroke();
      ellipse(x1+X,y1+Y,10,10);
    }

  // Digital display
  textFont(font2,40);
  fill(0);
  textAlign(CENTER);
  text(Ts,290+X,65+Y);
  fill(0);
  textAlign(CENTER);
  text(Tm,215+X,65+Y);
  fill(0);
  textAlign(CENTER);
  text(Th,140+X,65+Y);

}

void dohyo()
{
  // draw the Dohyo:
  fill(0);
  ellipse (board_size/2,board_size/2,dohyo_dia,dohyo_dia);
  fill(255);
  ellipse (board_size/2,board_size/2,dohyo_dia-dohyo_bor*2,dohyo_dia-dohyo_bor*2);

  // draw the Shikiri lines:
  fill(100);
  rect(board_size/2-10*5,board_size/2,2*5,20*5);
  rect(board_size/2+10*5,board_size/2,2*5,20*5);
  
  

  
} // end of function dohyo

