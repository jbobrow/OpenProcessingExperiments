
/*
  Dec. 21, 2011 ...
  Jiansheng Feng ...
  Simulation of a bizzare universe with 2 planets ...;
*/

//import processing.video.*;
//MovieMaker mM;

int SizeX = 200;
int SizeY = 200;
color BackgroundColor = color(222,222,222);
 
float P1Dia = 36;
float P2Dia = 28;
float P1Den = 0.10;
float P2Den = 0.13;

float minDist = (P1Dia+P2Dia)/2.0;
float interactionRange = 16.0;
float interactDist = minDist + interactionRange;
float AttrPower = -1.9;
float AttrCoeff = 6.6;
float ReplPower = -1.3;
float ReplCoeff = 4.0;
float TimeStep = 0.4;

float P1Xinit = SizeX/4.0;
float P1Yinit = SizeY/2.0;
float P2Xinit = SizeX*3.0/4;
float P2Yinit = SizeY/2.0;

color P1Color = color(random(101,201),random(101,201),random(101,201));
color P2Color = color(random(0,100),random(0,100),random(0,100));

float minSpeed = 14.0;
float maxSpeed = 18.0;

Planet P1;
Planet P2;

float P1Mass = pow(P1Dia, 2)*P1Den/1000.0;
float P2Mass = pow(P2Dia, 2)*P2Den/1000.0;


void setup()
{
  size(SizeX, SizeY);
  background(BackgroundColor);
  //mM = new MovieMaker(this, SizeX, SizeY, "bizarrerse.mov");
  //frameRate(8);
  smooth();
  P1 = new Planet(P1Color,P1Xinit,P1Yinit,P1Dia,P1Den);
  P2 = new Planet(P2Color,P2Xinit,P2Yinit,P2Dia,P2Den);
}


void draw()
{
  P1.gogo();
  P2.gogo();
  interact();
  background(BackgroundColor);
  P1.show();
  P2.show();
  stroke(0);
  line(P1.PlanetCoord.x,P1.PlanetCoord.y,
          P2.PlanetCoord.x,P2.PlanetCoord.y);
  /*
  mM.addFrame();
  if (frameCount >= 800)
  {  mm.finish();
     exit();  }
  */
  //delay(100);
}


void interact()
{
  PVector r12 = PVector.sub(P1.PlanetCoord, P2.PlanetCoord);
  float d = r12.mag();
  if (d < 6.0)
  {  d = 6.0;  } 
  
  if (d < interactDist)
  {
    if (d < minDist)
    { float AttrForce = AttrCoeff*pow(d,AttrPower-1); 
      P1.PlanetVeloc.sub(PVector.mult(r12, AttrForce/P1Mass));  
      P2.PlanetVeloc.add(PVector.mult(r12, AttrForce/P2Mass));  }
    else
    { float ReplForce = ReplCoeff*pow(d,ReplPower-1); 
      P1.PlanetVeloc.add(PVector.mult(r12, ReplForce/P1Mass));  
      P2.PlanetVeloc.sub(PVector.mult(r12, ReplForce/P2Mass));  }
  }  
  
  if (P1.PlanetVeloc.mag() > 10.0)
  {  P1.PlanetVeloc.div(5.0);  }
  if (P2.PlanetVeloc.mag() > 10.0)
  {  P2.PlanetVeloc.div(5.0);  }
}


class Planet
{
  color PlanetColor;
  PVector PlanetCoord;
  PVector PlanetVeloc;
  float PlanetDia;
  float PlanetDen;
  
  Planet(color tempC, float tempX, float tempY, float tempDia, float tempDen)
  {
    PlanetColor = tempC;
    PlanetCoord = new PVector(tempX, tempY);
    PlanetDia = tempDia;
    PlanetDen = tempDen;
    PlanetVeloc = new PVector(random(minSpeed, maxSpeed), random(minSpeed, maxSpeed));
  }
  
  
  void gogo()
  {
    PlanetCoord.add(PVector.mult(PlanetVeloc,TimeStep));
    
    if(PlanetCoord.x < 0)
    {  PlanetCoord.x *= -1.0;  
       PlanetVeloc.x *= -1.0;  }
    if(PlanetCoord.x > SizeX)
    {  PlanetCoord.x = SizeX-(PlanetCoord.x-SizeX);  
       PlanetVeloc.x *= -1.0;  }
       
    if(PlanetCoord.y < 0)
    {  PlanetCoord.y *= -1.0;  
       PlanetVeloc.y *= -1.0;  }
    if(PlanetCoord.y > SizeY)
    {  PlanetCoord.y = SizeY-(PlanetCoord.y-SizeY);  
       PlanetVeloc.y *= -1.0;  }
  }
  
  
  void show()
  {
    noStroke();
    fill(PlanetColor);
    ellipse(PlanetCoord.x,PlanetCoord.y, PlanetDia,PlanetDia);
    fill(255);
    ellipse(PlanetCoord.x,PlanetCoord.y, 6,6);
  }
}                                                                                                               
