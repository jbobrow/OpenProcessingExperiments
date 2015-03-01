
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
SumoBot bot1;
SumoBot bot2;

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
  bot1 = new SumoBot(20*5,30*5,color(0,255,0),boardX/2+190,boardY/2-80,45); // green, right; 20*30 cm
  bot2 = new SumoBot(20*5,20*5,color(0,0,255),boardX/2-170,boardY/2+40,0); // blue, left; 20*20 cm
   
  background(255);
  dohyo(); // draws the Dohyo
  bot1.display1();


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
  
    // bot1:
//    bot1.move1(random(-5,3),random(-5,5));
    bot1.move2();
    bot1.coords();    
    bot1.checkBorder();
    bot1.display1();

    // bot2:
//    bot2.move1(random(-3,5),random(-5,5));
    bot2.coords();    
//    bot2.checkBorder();
    bot2.display1();

    bot1.checkContact();
    
  }  // end of: if startS

} // end of: function draw



class SumoBot
{
float botLx;  // side dimensions in X
float botLy;  // side dimensions in Y
color botC1;  // color, variable
color botC0;  // color, fixed
float botX;   // coordinates of the bot center
float botY; 
float botA;   // orientation, angle from the +X axis to the Lx side (clockwise is positive)
float [] botCo = new float[8]; // coords x,y of the quadrangle representing the bot

// Constructor:
SumoBot(float tempLx, float tempLy, color tempC, float tempX, float tempY, float tempA)
{
  botLx = tempLx;
  botLy = tempLy;
  botC0 = tempC;
  botC1 = botC0;
  botX  = tempX;
  botY  = tempY; 
  botA  = radians(tempA);
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


// Class function turn1:
// Turns a specified angle - in RADS!
void turn1(float A)
{
  botA += A;
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

// Class function coords:
// Calculates the coordinates of the bot corners from the center and the angle
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

// Class function detectBorder1:
// Identifies if any of the bot corners touches the border.
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
// Identifies if the center of the bot reaches the border of the Dohyo.
boolean detectBorder2()
{
  boolean CSensor = false; 
  float distC=dist(botX,botY,dohyoX,dohyoY);  // distance from the bot CDG to the center of the Dohyo
  
  if (distC > (dohyoD/2))
    CSensor = true;
  return CSensor;
}

// Class function checkBorder
// Checks the position of the bot (corners and center) and changes color as necessary
void checkBorder()
{
   if (detectBorder2())  // if center out of dohyo:
    botC1 = color(255,0,0);  // change to red
  else
  {
    if (detectBorder1())  // if border out of dohyo:
      botC1 = color(255,150,0);  // change to orange
    else
      botC1 = botC0;  // else return to original color
  }
    
//  print("Color RGB: ");
//  print(red(botC1),",");
//  print(green(botC1),",");
//  print(blue(botC1));
//  println(" ");
}

// Class function detectContact1
// Detects if the circumscribed circles of the bots are in contact.
boolean detectContact1()
{
  boolean CSensor = false; 
  float distB=dist(bot1.botX, bot1.botY, bot2.botX,bot2.botY);  // distance between the bot's CMs
  if (distB < 0.5*(sqrt(sq(bot1.botLx)+sq(bot1.botLy))+sqrt(sq(bot2.botLx)+sq(bot2.botLy))))
    CSensor = true;
  return CSensor;
}

// Class function detectContact2
// Detects if the shapes of the bots are in contact.
// Checks if the corners of bot1 are within bot2, and then the opposite
boolean detectContact2()
{
  boolean CSensor = false; 
  float Xd, Yd, Xr, Yr;
  int i;

  // verification of the position of the corners of bot1 within bot2 through change of coordinates to the corner 0,1 of bot2:
  i=0;
  while ((i<4) && (!CSensor)) 
  {
    // 1) displacement: (x,y)(rel) = (x,y)(abs) - (botX,botY)(abs)
    Xd = bot1.botCo[2*i  ]-bot2.botCo[0];
    Yd = bot1.botCo[2*i+1]-bot2.botCo[1];
    // 2) rotation A: u=x cosA + y sinA; v = -x sinA + y cosA
    Xr = Xd*cos(bot2.botA)+Yd*sin(bot2.botA);
    Yr =-Xd*sin(bot2.botA)+Yd*cos(bot2.botA);
    // check if the new coordinates of bot1 are within bot2:
    if (Xr>=0 && Xr<=bot2.botLx && Yr<=0 && Yr>=-bot2.botLy)  // Y is positive downwards...
      CSensor = true;
    i++;

//  print("Coords point:",i,"");
//  print(" Xd, Yd:",Xd,",",Yd,"||");      
//  print(" Xr, Yr:",Xr,",",Yr);
//  println(" ");  
  }
  
  // and now, check if the corners of bot2 are within bot1:
  i=0; 
  while ((i<4) && (!CSensor)) 
  {
    // 1) displacement: (x,y)(rel) = (x,y)(abs) - (botX,botY)(abs)
    Xd = bot2.botCo[2*i  ]-bot1.botCo[0];
    Yd = bot2.botCo[2*i+1]-bot1.botCo[1];
    // 2) rotation A: u=x cosA + y sinA; v = -x sinA + y cosA
    Xr = Xd*cos(bot1.botA)+Yd*sin(bot1.botA);
    Yr =-Xd*sin(bot1.botA)+Yd*cos(bot1.botA);
    // check if the new coordinates of bot1 are within bot2:
    if (Xr>=0 && Xr<=bot1.botLx && Yr<=0 && Yr>=-bot1.botLy)  // Y is positive downwards...
      CSensor = true;
    i++;

//  print("Coords point:",i,"");
//  print(" Xd, Yd:",Xd,",",Yd,"||");      
//  print(" Xr, Yr:",Xr,",",Yr);
//  println(" ");  
  }
  
  return CSensor;
}

// Class function checkContact
// Checks the contact between bots and changes color as necessary
void checkContact()
{
  if (detectContact1()) // first we check for the nearness
  {  if (detectContact2()) // then for the details, corner-to-corner
    {
      bot1.botC1 = color(0,0,0);  // change to black
      bot2.botC1 = color(0,0,0);
    }
    else
    {
      bot1.botC1 = bot1.botC0;  // change to black
      bot2.botC1 = bot2.botC0;
    }    
  }
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
  ellipse((botCo[4]+botCo[6])*0.5,(botCo[5]+botCo[7])*0.5,5,5); // center of side 3-4
  noStroke();

}

} // end of Class SumoBot
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
*/
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

