
/*
  SumoBot Simulation Program
  An environment for SumoBot combat simulation.
  By Ricardo Gonzalez-Haba - rigonz2@netscape.net 
*/

// Declaration of global variables:
// Dohyo related (scale of dwg: 5 pixels = 1 cm):
int boardX = 900; // 180 cm * 5 = 900 pixels
int boardY = 900; 
int dohyoD = 154*5; // 154 cm diam
int dohyoB = 5*5; // 5 cm
int dohyoX = boardX/2;
int dohyoY = boardY/2;
int fps = 30; // frame rate 
int rotU = 5; // degress of rotation per mouse click

// Assorted control:
boolean startS = false;

// Clock:
int Ts0, Tm0, Th0; // seconds, minutes and hours - time at starting (mouseClicked)


// Declaration of Objects:
// Bots:
SumoBot [] bot = new SumoBot[2]; 

// Fonts:
PFont font1;

void setup() 
{
  // Board etc.
  size(boardX, boardY);
  smooth();
  rectMode(CENTER);
  frameRate(fps);
  
  // Fonts:
  font1 = loadFont("Impact-48.vlw");
  
  // Object initialization:
  bot[0] = new SumoBot(0,20*5,30*5,color(0,255,0),boardX/2+190,boardY/2-80,45); // green, right; 20*30 cm
  bot[1] = new SumoBot(1,20*5,20*5,color(0,0,255),boardX/2-170,boardY/2+40,20); // blue, left; 20*20 cm
   
  background(255);
  dohyo(); // draws the Dohyo
  bot[0].display1();
  bot[1].display1();


} // end of: function setup

void draw() 
{
  // Declaration of variables: 

  if (startS == true)
  {  
    // Core of main program:
    background(255);
    dohyo(); // draws the Dohyo
    
    // Clock:
    callClock();
  
    // bot[0]:
//    bot[0].move1(random(-5,3),random(-5,5));
//    bot[0].move2(); // follow the mouse
//    bot[0].turn4(0); // turn in the direction of the other bot (ABSOLUTE)
//    bot[0].turn5(0); // turn in the direction of the other bot (RELATIVE), sensors in the corners
    bot[0].turn6(0); // turn in the direction of the other bot (RELATIVE), sensors in the middle of the sides
    
    bot[0].move3(3); // move forward, relative to the bot
    bot[0].coords();    
 
    // bot[1]:
//    bot[1].move1(random(-5,5),random(-5,5));
    bot[1].move2(); // follow the mouse
    bot[1].coords();    

    checkContact1();  // this function ckecks both bots
    
    bot[0].display1();    
    bot[1].display1();
    
    
  }  // end of: if startS

} // end of: function draw



class SumoBot
{
// Variables:
float botLx;  // side dimensions in X
float botLy;  // side dimensions in Y
color botC1;  // color, variable
color botC0;  // color, fixed
float botX;   // coordinates of the bot center
float botY; 
float botA;   // orientation, angle from the +X axis to the Lx side (clockwise is positive)
int   botId;  // id of the bot: 0, 1
float [] botCo = new float[8]; // coords x,y of the quadrangle representing the bot

// Constructor:
SumoBot(int tempId, float tempLx, float tempLy, color tempC, float tempX, float tempY, float tempA)
{
  botId = tempId;
  botLx = tempLx;
  botLy = tempLy;
  botC0 = tempC;
  botC1 = botC0;
  botX  = tempX;
  botY  = tempY; 
  botA  = radians(tempA);
}

// Functionality:

// Class function coords:
// Calculates the coordinates of the bot corners from the center and the angle
// [0,1] => coords (X,Y) of point 1
// [2,3] => point 2
// [4,5] => point 3
// [6,6] => point 4
// point 1 is in the lower left corner from the center of the bot.
// points 2, 3, 4 are defined counter-clockwise from 1.
void coords()
{
  float angle = atan(botLy/ botLx);
  float diag = sqrt(sq(botLx)+sq(botLy));
  botCo[0]=botX-diag/2*cos(angle-botA);
  botCo[1]=botY+diag/2*sin(angle-botA);
  botCo[2]=botCo[0]+botLx*cos(botA);
  botCo[3]=botCo[1]+botLx*sin(botA);
  botCo[4]=botCo[2]+botLy*sin(botA);
  botCo[5]=botCo[3]-botLy*cos(botA);
  botCo[6]=botCo[4]-botLx*cos(botA);
  botCo[7]=botCo[5]-botLx*sin(botA);
}

// Class function move1:
// Movement in X and Y - no change in angle.
void move1(float X, float Y)
{
  botX += X;
  botY += Y;
}

// Class function move2:
// Movement in X and Y following the mouse - no change in angle.
void move2()
{
  botX = mouseX;
  botY = mouseY;
}

// Class function move3:
// Movement in the direction of the bot - parallel to sides 2 and 4.
void move3(float dist)
{
  botX += dist*sin(botA);
  botY -= dist*cos(botA);
}

// Class function turn1:
// Turns a specified angle - in RADS!
void turn1(float A)
{
  botA += A;
  checkAngle();
}

// Class function turn2:
// Turns the bot following the mouse clicks
void turn2()
{
  if (mousePressed && (mouseButton == LEFT)) 
  {
    botA -= radians(rotU);
  } 
  else if (mousePressed && (mouseButton == RIGHT)) 
    {
      botA += radians(rotU);
    }
  checkAngle();
}

// Class function turn3:
// Turns the bot pointing to the mouse
void turn3()
{
  float angle;
  if ((mouseX-botX) != 0)
    angle = 0.5*PI-atan2(botY-mouseY,mouseX-botX)-botA;
  else
    angle = 0.5*PI - botA;
  turn1(angle);  
}

// Class function turn4:
// Turns the bot pointing to the other bot
// The position of the other bot is referred to the quadrants (in ABSOLUTE coords!!) centered in the sensing bot:
/*  4 | 3
    --x--
    1 | 2
*/
void turn4(int botRef1)
{
  int posBot1;
  int posBot2 = sensor1(); // returns the quadrant (1..4) where the other bot is located
  // Direction to which the sensing bot is pointing:
  // (Also in reference to the absolute quadrants centered in the sensing bot):
  if (botA>=0 && botA<HALF_PI)
    posBot1 = 3;
  else
    if (botA>=HALF_PI && botA<PI)
      posBot1 = 2;
    else
      if (botA>=PI && botA<3*HALF_PI)
        posBot1 = 1;  
      else
        posBot1 = 4;
  
  if ((posBot1-posBot2) == 0)
    botA += 0; // No change (so far...)
  else
    if ((posBot1-posBot2) == 1 || (posBot1-posBot2) == -3)
      botA += radians(5); // 5º change clockwise
    else
      if ((posBot1-posBot2) == -1 || (posBot1-posBot2) == 3)
        botA += radians(-5); // 5º change counter-clockwise
      else
        if (abs(posBot1-posBot2) == 2)
          botA += PI; // U-turn, reverse direction

  checkAngle();
}

// Class function turn5:
// Turns the bot pointing to the other bot
// The position of the other bot is referred to the quadrants (in RELATIVE coords!!) from the sensing bot:
/*  4 | 3
    --x--
    1 | 2
*/
void turn5(int botRef1)
{
  int posBot2 = sensor2(); // returns the quadrant (1..4) where the other bot is located, in the relative system of botRef1 
  switch (posBot2)
  {
    case 1:
      botA += radians(225);
     break;
    case 2:
      botA += radians(135);
      break;
    case 3:
      botA += radians(45);
      break;
    case 4:
      botA += radians(315);
  }
  checkAngle();
}

// Class function turn6:
// Turns the bot pointing to the other bot
// The position of the other bot is referred to the quadrants (in RELATIVE coords!!) from the sensing bot:
/*  \ 3 /
    4 x 2
    / 1 \
  Hence: there are 4 sensors, in the middle of the sides of the bot.
*/
void turn6(int botRef1)
{
  int posBot2 = sensor2(); // returns the quadrant (1..4) where the other bot is located, in the relative system of botRef1
  switch (posBot2)
  {
    case 1:
      botA = radians(180);
     break;
    case 2:
      botA += radians(90);
      break;
    case 3:
      botA += 0;
      break;
    case 4:
      botA += radians(270);
  }
  checkAngle();
}



// Class function detectBorder1:
// Identifies if any of the bot corners touches the internal edge of the Dohyo border.
boolean detectBorder1()
{
  float [] distC = new float[4]; // distance from bot corners to dohyo center
  boolean CSensor = false;  // corner sensor
  int i;
  
  for (i=0;i<4;i++)
    distC[i]=dist(botCo[2*i],botCo[2*i+1],dohyoX,dohyoY);     
  
  i=0;
  while ((i<4) && (!CSensor)) // verification of the distance from the corners to the Dohyo center:
  {
    if (distC[i] >= (dohyoD/2-dohyoB))
      CSensor = true;
    i++;
  }
  return CSensor;
}

// Class function detectBorder2
// Identifies if the center of the bot reaches the external edge of the Dohyo border.
boolean detectBorder2()
{
  boolean CSensor = false; 
  float distC=dist(botX,botY,dohyoX,dohyoY);  // distance from the bot CM to the center of the Dohyo
  
  if (distC > (dohyoD/2))
    CSensor = true;
  return CSensor;
}

// Class function sensor1:
// Senses the presence of the other bot and returns its.
// The position of the other bot is referred to the quadrants (in ABSOLUTE coords!!) centered in the sensing bot:
/*  4 | 3
    --x--
    1 | 2
  Hence: the sensors are in the corners of the sensing bot.
*/
int sensor1()
{
  int botRef1, botRef2; // botRef1 is the sensing bot; botRef2 is the detected bot.
  int result;

  botRef1=botId;  
  if (botRef1 == 0)
    botRef2 = 1;
  else
    botRef2 = 0; 
  
  if (bot[botRef2].botX<=bot[botRef1].botX && bot[botRef2].botY>=bot[botRef1].botY)
    result = 1;
  else 
    if (bot[botRef2].botX>=bot[botRef1].botX && bot[botRef2].botY>=bot[botRef1].botY)
      result = 2;
    else 
      if (bot[botRef2].botX>=bot[botRef1].botX && bot[botRef2].botY<=bot[botRef1].botY)
        result = 3;
      else 
        result = 4;
    
  return result;
}

// Class function sensor2:
// Senses the presence of the other bot and returns the position of the other bot.
// The position of the other bot is referred to the quadrants (in RELATIVE coords!!) from the sensing bot:
/*  4 | 3
    --x--
    1 | 2
  Hence: there are 4 sensors, in the corners.
*/
int sensor2()
{
  int botRef1, botRef2; // botRef1 is the sensing bot; botRef2 is the detected bot.
  int result;
  
  botRef1=botId;  
  if (botRef1 == 0)
    botRef2 = 1;
  else
    botRef2 = 0; 
  
  float Xr,Yr; // coordinates of botRef2 in the botRef1 relative coordinates system located in the center of botRef1.
  Xr=changeCoordsX(bot[botRef2].botX,bot[botRef2].botY,bot[botRef1].botX,bot[botRef1].botY,bot[botRef1].botA);
  Yr=changeCoordsY(bot[botRef2].botX,bot[botRef2].botY,bot[botRef1].botX,bot[botRef1].botY,bot[botRef1].botA);   
  
  if (Xr<=0 && Yr>=0)
    result = 1;
  else 
    if (Xr>=0 && Yr>=0)
      result = 2;
    else 
      if (Xr>=0 && Yr<=0)
        result = 3;
      else 
        result = 4;
    
  return result;
}

// Class function sensor3:
// Senses the presence of the other bot and returns the position of the other bot.
// The position of the other bot is referred to the quadrants (in RELATIVE coords!!) from the sensing bot:
/*  \ 3 /
    4 x 2
    / 1 \
  Hence: there are 4 sensors, in the middle of the sides of the bot.
*/
int sensor3()
{
  int botRef1, botRef2; // botRef1 is the sensing bot; botRef2 is the detected bot.
  int result;
  
  botRef1=botId;  
  if (botRef1 == 0)
    botRef2 = 1;
  else
    botRef2 = 0; 
  
  float Xr,Yr; // coordinates of botRef2 in the botRef1 relative coordinates system located in the center of botRef1.
  Xr=changeCoordsX(bot[botRef2].botX,bot[botRef2].botY,bot[botRef1].botX,bot[botRef1].botY,bot[botRef1].botA);
  Yr=changeCoordsY(bot[botRef2].botX,bot[botRef2].botY,bot[botRef1].botX,bot[botRef1].botY,bot[botRef1].botA);   
  
  if (Yr>=0 && abs(Xr)<Yr)
    result = 1;
  else 
    if (Xr>=0 && abs(Yr)<Xr)
      result = 2;
    else 
      if (Yr<=0 && abs(Xr)<abs(Yr))
        result = 3;
      else 
        result = 4;
    
  return result;
}


// Class function display1:
// display the bot 
void display1()
{
  fill(botC1);
  quad(botCo[0],botCo[1],botCo[2],botCo[3],botCo[4],botCo[5],botCo[6],botCo[7]);
  noStroke();fill(255);
  ellipse(botX,botY,10,10); // center  
  strokeWeight(1);stroke(botC1);
  ellipse((botCo[4]+botCo[6])*0.5,(botCo[5]+botCo[7])*0.5,5,5); // center of side 3-4: "head"
  stroke(150);
  ellipse((botCo[0]+botCo[6])*0.5,(botCo[1]+botCo[7])*0.5,5,5); // center of side 1-4: "sensor1"
  ellipse((botCo[2]+botCo[4])*0.5,(botCo[3]+botCo[5])*0.5,5,5); // center of side 2-3: "sensor2"
  noStroke();
}

// Class function checkAngle:
// Ensures botA angles are within 0-2PI:
void checkAngle()
{
  if (botA>2*PI)
    botA -= 2*PI;
  else
    if (botA<0)
      botA += 2*PI;
    
}
} // end of Class SumoBot
// Function callClock: calls digitalClock with the position of the clock and the time intended to be displayed
void callClock()
{    
  int Ts1, Tm1, Th1; // seconds, minutes and hours - actual time
  int Ts; // seconds since starting the competition
  int TsCombat = 3*60; // duration of the combat, seconds

  // Actual time: 
  Th1 = hour();
  Tm1 = minute();
  Ts1 = second();       
  digitalClock(-75,0,Th1,Tm1,Ts1);

  //Remaining time:
  Ts = TsCombat+(Th0-Th1)*3600+(Tm0-Tm1)*60+(Ts0-Ts1);
  digitalClock(-75+600,0,floor(Ts/3600),floor(Ts/60),Ts%60);
  
} // end of function callClock
// Functions for change of coordinates.
// Provide the coordinates of a point (X,Y) in a local coordinates system whose center is (x0,y0) and is at an angle A with the absolute coordinates system.
// (The local coordinates system is also "clock-wise").

float changeCoordsX(float X, float Y, float X0, float Y0, float A0)
{
  float Xd, Yd, Xr, Yr;  
  // 1) displacement: (u,v) = (x,y) - (botX,botY)(corner)
  Xd = X-X0;
  Yd = X-Y0;
  // 2) rotation A: u=x cosA + y sinA; v = -x sinA + y cosA
  Xr = Xd*cos(A0)+Yd*sin(A0);
  //Yr =-Xd*sin(A0)+Yd*cos(A0);
  return Xr;
}  
    
float changeCoordsY(float X, float Y, float X0, float Y0, float A0)
{
  float Xd, Yd, Xr, Yr;  
  // 1) displacement: (u,v) = (x,y) - (botX,botY)(corner)
  Xd = X-X0;
  Yd = X-Y0;
  // 2) rotation A: u=x cosA + y sinA; v = -x sinA + y cosA
  //Xr = Xd*cos(A0)+Yd*sin(A0);
  Yr =-Xd*sin(A0)+Yd*cos(A0);
  return Yr;
}
// Function detectContact1
// Detects if the circumscribed circles of the bots are in contact.
boolean detectContact1()
{
  boolean CSensor = false; 
  float distB=dist(bot[0].botX,bot[0].botY,bot[1].botX,bot[1].botY);  // distance between the bot's centers
  if (distB < 0.5*(sqrt(sq(bot[0].botLx)+sq(bot[0].botLy))+sqrt(sq(bot[1].botLx)+sq(bot[1].botLy))))
    CSensor = true;
  return CSensor;
}

// Function detectContact2
// Detects if the shapes of the bots are in contact.
// Checks if the corners of bot0 are within bot1, and then the opposite.
boolean detectContact2()
{
  boolean CSensor = false; 
  float Xr, Yr;  // coordinates in the relative reference system
  int i;

  // verification of the position of the corners of bot0 within bot1 through change of coordinates to the corner [0,1] of bot1:
  i=0;
  while ((i<4) && (!CSensor)) 
  {
    Xr=changeCoordsX(bot[0].botCo[2*i],bot[0].botCo[2*i+1],bot[1].botCo[0],bot[1].botCo[1],bot[1].botA);
    Yr=changeCoordsY(bot[0].botCo[2*i],bot[0].botCo[2*i+1],bot[1].botCo[0],bot[1].botCo[1],bot[1].botA);   
    // check if the new coordinates of bot0 are within bot1:    
    if (Xr>=0 && Xr<=bot[1].botLx && Yr<=0 && Yr>=-bot[1].botLy)  // Y is positive downwards...
      CSensor = true;
    i++;

//  print("Coords point:",i,"");
//  print(" Xd, Yd:",Xd,",",Yd,"||");      
//  print(" Xr, Yr:",Xr,",",Yr);
//  println(" ");  
  }
  
  // and now, check if the corners of bot1 are within bot0:
  i=0; 
  while ((i<4) && (!CSensor)) 
  {
    Xr=changeCoordsX(bot[1].botCo[2*i],bot[1].botCo[2*i+1],bot[0].botCo[0],bot[0].botCo[1],bot[0].botA);
    Yr=changeCoordsY(bot[1].botCo[2*i],bot[1].botCo[2*i+1],bot[0].botCo[0],bot[0].botCo[1],bot[0].botA);
    // check if the new coordinates of bot1 are within bot2:
    if (Xr>=0 && Xr<=bot[0].botLx && Yr<=0 && Yr>=-bot[0].botLy)  // Y is positive downwards...
      CSensor = true;
    i++;
  }
  
  return CSensor;
}

// Function checkContact1
// Checks the contact conditions and changes color as necessary
void checkContact1()
{
  // first we check for contact between the bots:
  if (detectContact1()) // first we check for the nearness between bots,
  {  if (detectContact2()) // then for the details, corner-to-corner
    {
      bot[0].botC1 = color(0,0,0);  // change to black
      bot[1].botC1 = color(0,0,0);
    }
    else
    {
      bot[0].botC1 = bot[0].botC0;  // change to original color
      bot[1].botC1 = bot[1].botC0;
    }    
  }
  else  // only now we check for the position within the Dohyo:
  {
    for (int i=0;i<2;i++)
    {
      if ( bot[i].detectBorder2())  // if center out of Dohyo:
        bot[i].botC1 = color(255,0,0);  // change to red
      else
      {
        if (bot[i].detectBorder1())  // if corner out of Dohyo:
          bot[i].botC1 = color(255,150,0);  // change to orange
        else
          bot[i].botC1 = bot[i].botC0;  // else return to original color
      }
    }
  }
  
//  print("Color RGB: ");
//  print(red(botC1),",");
//  print(green(botC1),",");
//  print(blue(botC1));
//  println(" ");
}
// Function digitalClock: displays a digital clock
// Based on work by Serge J Desjardins aka techone / tech37
void digitalClock(int X, int Y, int Th, int Tm, int Ts)
{
  // Display the box:
  fill(255);
  strokeWeight(4);
  stroke(0,69,162);
  quad(X+100,Y+20,X+325,Y+20,X+325,Y+80,X+100,Y+80);

  // Display the dots inside the digital box:
  for (int x1 = 175; x1 < 300; x1 += 75)
    for (int y1 = 40; y1 < 70; y1 += 20)
    {
      fill(255,145,0);
      noStroke();
      ellipse(x1+X,y1+Y,10,10);
    }

  // Digital display
  textFont(font1,40);
  fill(0);
  textAlign(CENTER);
  text(Ts,290+X,65+Y);
  fill(0);
  textAlign(CENTER);
  text(Tm,215+X,65+Y);
  fill(0);
  textAlign(CENTER);
  text(Th,140+X,65+Y);

} // end of function digitalClock

// Function dohyo: draws the combat board
void dohyo()
{
  // draw the Dohyo:
  fill(0);
  ellipse (boardX/2,boardY/2,dohyoD,dohyoD);
  fill(255);
  ellipse (boardX/2,boardY/2,dohyoD-dohyoB*2,dohyoD-dohyoB*2);

  // draw the Shikiri lines:
  fill(100);
  rect(boardX/2-10*5,boardY/2,2*5,20*5);
  rect(boardX/2+10*5,boardY/2,2*5,20*5);
  
} // end of function dohyo
// Function mouseClicked: for start/stop the combat
void mouseClicked() 
{
  startS = !startS;
  Th0 = hour();
  Tm0 = minute();
  Ts0 = second();
  
} // end of function mouseClicked
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
  Version 05: 14.10.20
  Clock rearranged.
  Rearrangement of the class functions: simpler actions, larger number.
  Version 06: 14.10.25
  The bots are now members of an array.
  Functions for detection of oponent introduced. 
  Functions that involve both bots are separated from the SumoBot class.
  Combined movements (strategies) introduced.
  
  
*/

