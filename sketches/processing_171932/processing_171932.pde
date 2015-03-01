
/*
  SumoBot Simulation Program
  An environment for SumoBot combat simulation.
  By Ricardo Gonzalez-Haba - rigonz2@netscape.net 
*/

// Box2D related input:
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to the box2d world
Box2DProcessing box2d;  

// Declaration of global variables:
// Board and coordinates box2D-world vs screen-pixel
float scaleWtP = 50; // The REAL scale of World to Pixel is, in MKS, 500 pixels = 1 m. I use 50 pixel/m because otherwise the collisions seem to be wrong.
float boardX = 900; // 1.80 m * 500 = 900 pixels
float boardY = 900; 
float Xp_ref = boardX/2; // position of the box2d center of coordinates
float Yp_ref = boardY/2; // position of the box2d center of coordinates

// Dohyo related:
float dohyoD = 1.54*500; // 1.54 m diam
float dohyoB = 0.05*500; // 0.05 m width
float dohyoX = boardX/2;
float dohyoY = boardY/2;

// Assorted control:
boolean startS = false;
int fps = 30; // frame rate 

// Clock:
int Ts0, Tm0, Th0; // seconds, minutes and hours - time at starting (mouseClicked)

// Declaration of Objects:
// Bots:
SumoBot [] bot = new SumoBot[2]; // Box2D

// Borders/boundaries:
BoundaryC [] borC = new BoundaryC[1];

// Fonts:
PFont font1;

// SETUP
void setup() 
{
  // Board etc.
  size(int(boardX),int(boardY));
  smooth();
  rectMode(CENTER);
  frameRate(fps);
  
  // Fonts:
  font1 = loadFont("Impact-48.vlw");

  // Initialize Box2D and create the world
  box2d = new Box2DProcessing(this);  
  box2d.createWorld(); 
  box2d.setGravity(0, 0);  // Custom gravity
 
  // Object initialization:
  // Box2D bots:
  bot[0] = new SumoBot(boardX/2-170,boardY/2+40,100,100,color(0,255,0)); // (X,Y,W,H)_Pixel,C; green, left
  bot[1] = new SumoBot(boardX/2+190,boardY/2-80,100,100,color(0,0,255)); //                  ; blue, right

  // Add some fixed boundaries
  borC[0] = new BoundaryC(boardX/2,boardY/2,dohyoD+50);  // X, Y, D, in pixels
  
  background(255);
  dohyo(); // draws the Dohyo

} // end of: function setup

// DRAW
void draw() 
{ 
  // Declaration of variables: 

  if (startS == true)
  {  
    // Core of main program:
    background(255);
    dohyo(); // draws the Dohyo
    
    // Draw the clock:
    callClock();

    // Step through time in Box2D:
    box2d.step(); 
    
    // Apply random forces on the bots:
    for (int i=0;i<2;i++) 
      bot[i].applyF1(random(1000,10000));    
    
    // Display all the Box2D boxes:
    for (int i=0;i<2;i++) 
      bot[i].display();
      
    // Display the boundaries:
//    borC[0].display();

    // Check the contact with the border of the Box2D boxes
    for (int i=0;i<2;i++)
      checkBorder1(i);
     
  }  // end of: if startS

} // end of: function draw



// A fixed (static) boundary class, of circular shape
class BoundaryC 
{
// Variables:
float borX; // center coords, pixels
float borY;
float borD; // diameter
int   borND = 200; // number of divisions of the circular border

Vec2[] borVertW = new Vec2[borND]; // coords of the vertices of the chain shape - world

//  Reference to a Box2D Body
Body borBody;  

// Constructor:
BoundaryC(float tempX,float tempY, float tempD) 
{
  borX = tempX; // pixels
  borY = tempY; // pixels
  borD = tempD; // pixels
  Vec2 aux = new Vec2(0.,0.);
  int i;

  // Create the body:
  BodyDef borBodyDef = new BodyDef();
  borBodyDef.type = BodyType.STATIC;
  borBody = box2d.createBody(borBodyDef);
  
  // Define the shape:
  ChainShape borChainShp = new ChainShape();
  for (i=0;i<borND;i++)
  {
    aux.x = borX+borD/2*cos(i*TWO_PI/borND); // pixels
    aux.y = borY+borD/2*sin(i*TWO_PI/borND);    
    borVertW[i] = PtW_V(aux);    
  }
  borChainShp.createLoop(borVertW, borND); // create the chain and close it (1st-last)
  
  // Attach shape to body using a Fixture:
  borBody.createFixture(borChainShp, 1);

} // end of Constructor

// Functionality:
// Draw the boundary
void display() 
{
  int i;
  strokeWeight(4);
  stroke(255,0,0);
  // Draw the ChainShape as a series of vertices:
  for (i=0;i<borND-1;i++)
    line(WtP_X(borVertW[i].x),WtP_Y(borVertW[i].y),WtP_X(borVertW[i+1].x),WtP_Y(borVertW[i+1].y));  
  line(WtP_X(borVertW[borND-1].x),WtP_Y(borVertW[borND-1].y),WtP_X(borVertW[0].x),WtP_Y(borVertW[0].y));  

  // back to normality:
  strokeWeight(0);
  noStroke();

} // end of display

} // end of class BoundaryC

// A rectangular box class for SumoBots based on box2d features
class SumoBot 
{ 
// Variables:
float botW, botH; // pixels
float botX, botY; // pixels
color botC0, botC1;
float botWDx, botWDy; // position of the driving wheels, pixels, from the bot center

//  Reference to a Box2D Body
Body botBody;  
  
// Constructor:
SumoBot(float tempX, float tempY, float tempW, float tempH, color tempC) // (X,Y,W,H)_pixels
{
  botX  = tempX;
  botY  = tempY; 
  botW  = tempW;
  botH  = tempH;
  botC0 = tempC;
  botC1 = tempC;
  botWDx= 40; // 40 pixel
  botWDy= 40;

  // Build the Body
  BodyDef botBodyDef = new BodyDef();      
  botBodyDef.type = BodyType.DYNAMIC;
  botBodyDef.position.set(PtW_X(botX),PtW_Y(botY));
  botBody = box2d.createBody(botBodyDef);

 // Define a Polygon shape - the bot rectangle:
  PolygonShape botPolShp = new PolygonShape();
  botPolShp.setAsBox(botW/(2*scaleWtP),botH/(2*scaleWtP)); // from pixel to box2d; divided by 2 because box2d considers half size (distance from center to sides)
  
  // Define a fixture:
  FixtureDef botFixDef = new FixtureDef();
  botFixDef.shape = botPolShp;
  
  // Parameters that affect physics:
  botFixDef.density = 75;      // max 3 kg/400 cm2 = 75 kg/m2
  botFixDef.friction = 0.3;    // This may need trials...
  botFixDef.restitution = 0.6; // This may need trials...

  // Attach Fixture to Body               
  botBody.createFixture(botFixDef);

} // end of Constructor
  
// Functionality:

// Class function display:
// Displays the bot in the pixel board after reading the coordinates in box2d.
void display() 
{
  // Body’s location and angle:
  Vec2 botPos = new Vec2(0.,0.);
  float botAng; 
  
  botPos = botBody.getPosition();
  botAng = botBody.getAngle();

  pushMatrix();
  translate(WtP_X(botPos.x),WtP_Y(botPos.y)); 
  rotate(-botAng); 
  fill(botC1);
  rectMode(CENTER);
  rect(0,0,botW,botH); // bot
  // highlight points:
  stroke(0);
  fill(255);
  ellipse(0,0,5,5); // center of bot
  stroke(0);
  ellipse(0,-botH/2,5,5); // center of side 3-4: "head"    
  // draw wwheels:
  stroke(0);
  fill(0);
  ellipse(-botWDx,-botWDy,5,5); // WD left
  ellipse( botWDx,-botWDy,5,5); // WD right 
  ellipse( 0,botWDy,5,5); // WD back
  popMatrix();
  
  // back to normality:  
  strokeWeight(0);
  noStroke();
}


// Class function applyF1:
// Applies a force acting on the center of the bot, with random direction and given force  
void applyF1(float F) 
{
  Vec2 pos = botBody.getPosition();
  float a  = random(0,TWO_PI);
  Vec2 dir = new Vec2(cos(a),sin(a));
  dir.mulLocal(F);
  botBody.applyForce(dir, pos); 
}

// Function applyForce1
// Applies a force at the center of the bot
void applyForce1(Vec2 v) 
{
  botBody.applyForce(v, botBody.getWorldCenter());
}

} // end of Class SumoBot2
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
// Functions that change the coordinates between the Processing reference (P, in pixels) system and the box2d system (W, in MKS)
float WtP_X(float Xw)
{
  return (Xw*scaleWtP+Xp_ref);
}

float WtP_Y(float Yw)
{
  return (-Yw*scaleWtP+Yp_ref);
}

Vec2 WtP_V(Vec2 vecW)
{
  Vec2 vecP = new Vec2 (0.,0.);
  vecP.x = WtP_X(vecW.x);
  vecP.y = WtP_Y(vecW.y);
  return (vecP);
}

float PtW_X(float Xp)
{
  return ((Xp-Xp_ref)/scaleWtP);
}

float PtW_Y(float Yp)
{
  return ((Yp_ref-Yp)/scaleWtP);
}

Vec2 PtW_V(Vec2 vecP)
{
  Vec2 vecW = new Vec2 (0.,0.);
  vecW.x = PtW_X(vecP.x);
  vecW.y = PtW_Y(vecP.y);
  return (vecW);
}

// Function detectBorder1:
// Identifies if any of the bot corners touches the internal edge of the Dohyo border.
boolean detectBorder1(int i)
{
  float distC = 0; // distance from bot corners to the Dohyo center
  float cornerX = 0;
  float cornerY = 0; // coords of the corner (pixels)
  boolean CSensor = false;  // corner sensor
  boolean [] botB = new boolean[4]; // key for border sensor reading of the corners

  // Body’s location and angle:
  Vec2 auxPos = new Vec2(0.,0.);
  float auxAng; 
  
  auxPos = bot[i].botBody.getPosition();
  auxAng = bot[i].botBody.getAngle();

  // transfer to pixels:
  auxPos = WtP_V(auxPos);

  // corner 1: lower, left:
  if (!CSensor)
  {
    cornerX = auxPos.x - bot[i].botW/2*cos(-auxAng) - bot[i].botH/2*sin(-auxAng);
    cornerY = auxPos.y - bot[i].botW/2*sin(-auxAng) + bot[i].botH/2*cos(-auxAng);
    distC = dist(cornerX,cornerY,dohyoX,dohyoY);
    if (distC >= (dohyoD/2-dohyoB))
    {
      CSensor = true;
      botB[0] = true;
    }
  }

  // corner 2: lower, right:
  if (!CSensor)
  {
    cornerX = auxPos.x + bot[i].botW/2*cos(-auxAng) - bot[i].botH/2*sin(-auxAng);
    cornerY = auxPos.y + bot[i].botW/2*sin(-auxAng) + bot[i].botH/2*cos(-auxAng);
    distC = dist(cornerX,cornerY,dohyoX,dohyoY);
    if (distC >= (dohyoD/2-dohyoB))
    {
      CSensor = true;
      botB[1] = true;
    }
  }

  // corner 3: upper, right:
  if (!CSensor)
  {
    cornerX = auxPos.x + bot[i].botW/2*cos(-auxAng) + bot[i].botH/2*sin(-auxAng);
    cornerY = auxPos.y + bot[i].botW/2*sin(-auxAng) - bot[i].botH/2*cos(-auxAng);
    distC = dist(cornerX,cornerY,dohyoX,dohyoY);
    if (distC >= (dohyoD/2-dohyoB))
    {
      CSensor = true;
      botB[2] = true;
    }
  }

  // corner 4: upper, left:
  if (!CSensor)
  {
    cornerX = auxPos.x - bot[i].botW/2*cos(-auxAng) + bot[i].botH/2*sin(-auxAng);
    cornerY = auxPos.y - bot[i].botW/2*sin(-auxAng) - bot[i].botH/2*cos(-auxAng);
    distC = dist(cornerX,cornerY,dohyoX,dohyoY);
    if (distC >= (dohyoD/2-dohyoB))
    {
      CSensor = true;
      botB[3] = true;
    }
  }

  return CSensor;
}

// Function checkBorder1
// Checks the contact conditions at the border of the Dohyo and changes color as necessary
void checkBorder1(int i)
{
  if (detectBorder1(i))
//  if (i==0)
    bot[i].botC1 = color(255,0,0);
  else
    bot[i].botC1 = bot[i].botC0;
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
  
  // back to normality:
  strokeWeight(0);
  noStroke();

} // end of function digitalClock

// Function dohyo: draws the combat board
void dohyo()
{
  // draw the Dohyo:
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse (boardX/2,boardY/2,dohyoD,dohyoD);
  fill(255);
  ellipse (boardX/2,boardY/2,dohyoD-dohyoB*2,dohyoD-dohyoB*2);

  // draw the Shikiri lines:
  stroke(100);
  fill(100);
  rect(boardX/2-10*5,boardY/2,2*5,20*5);
  rect(boardX/2+10*5,boardY/2,2*5,20*5);
  
  // back to normality:
  strokeWeight(0);
  noStroke();
  
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
checkContact4 only controls for one corner outside the dohyo; but if the corner is well witin the border (f.eg because tehre are two corners inside the border) then it is not possible to escape from there.
strategy: go straight from side to side, measure the time and assess the bot position based on the time=distance (at known speed).




*/
/*


for (i=0;i<borC[0].borND-1;i++)
{
print(i);
print(" | ");
print(borC[0].borVertW[i].x); 
print(" | ");
print(borC[0].borVertW[i].y);
print(" | ");
print(WtP_X(borC[0].borVertW[i].x)); 
print(" | ");
print(WtP_Y(borC[0].borVertW[i].y));      
println(" "); 
}

Vec2 botPos = bot[i].botBody.getPosition(); 
float botAng = bot[i].botBody.getAngle();
print(i);
print(" | ");
print(botPos.x); 
print(" | ");
print(botPos.y); 
print(" | ");
print(botAng); 
print(" | ");
print(WtP_X(botPos.x)); 
print(" | ");
print(WtP_Y(botPos.y));      
println(" "); 

//textFont(font1,25);
//textAlign(CENTER);
//text(botPos.x,botPos.x,botPos.y-25);
//text(botPos.y,botPos.x,botPos.y+0);
//text(cornerX,botPos.x,botPos.y+25);
//text(cornerY,botPos.x,botPos.y+50);
//text(botAng,botPos.x,botPos.y+75);
//text(distC,botPos.x,botPos.y+100);

// Class function attractForce:
// Applies a foce of magnitude F in the center of the bot, in the direction (x,y)_pixel
void attractForce(float x,float y, float F) 
{
  Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);  // coords (x,y) in the box2d/World system
  Vec2 bodyVec = botBody.getWorldCenter(); // coords of the center of body, in World system
  worldTarget.subLocal(bodyVec);  // vector going from the body to the specified point
  // Scale the vector to the specified force:
  worldTarget.normalize();
  worldTarget.mulLocal(F);
  // Apply the force to the body's center of mass.
  botBody.applyForce(worldTarget, bodyVec);
}

// Class function applyForce:
// Applies a force acting on the center of the bot...  
void applyForce(Vec2 force) 
{
  Vec2 pos = botBody.getWorldCenter();
  botBody.applyForce(force, pos);
}



*/
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
  Functions for detection & tracking of the oponent are introduced. 
  Functions that involve both bots are separated from the SumoBot class.
  Functions aimed at avoiding the border when detected are introduced.
  Version 07: 14.10.29
  Box2D (jbox2d) introduced with care...
  Coordinates conversion betwwen Prcessing/pixel and box2d/MKS (jbox2d coordinate changes not useful)
  Introduced control of position with respect to the border of the Dohyo.
  Version 08: 14.11.13
  Standard bot removed.
  Rectangular boundary substituted for circular one.
  Functions simplified just for collision verification.
  The scale ratio scaleWtP = 500 (5 pixels = 1 cm, in MKS 500 pixels = 1 m) does not work well: bodies seem to have a boundary around them that prevents collisions.
  I change to scaleWtP = 50, which makes the real world be 10 times actually larger, but at least it is visually working.
  Colors introduced again.
  Collisions work now with the control of position of the bot in the dohyo, and change color!
  Random forces now act on the bots. Gravity removed.
  
*/


