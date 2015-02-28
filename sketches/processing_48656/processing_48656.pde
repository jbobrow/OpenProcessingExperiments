
/*
  Dec. 23, 2011 ...
  Jiansheng Feng ...
  Simulation of a bizzare universe with 3 planets ...;
*/


//int SizeX = 356;
//int SizeY = 220;
int SizeX = 200;
int SizeY = 200;
color BackgroundColor = color(222,222,222);
color Amber = color(255, 126, 0);
color Sapphire = color(0, 103, 165);
color Turquoise = color(64, 224, 208);

float P1Dia = 22;
float P2Dia = 33;
float P3Dia = 44;
float P1Den = 8;
float P2Den = 6;
float P3Den = 4;
color P1Color = Amber;
color P2Color = Sapphire;
color P3Color = Turquoise;
float D_average = (P1Dia+P2Dia+P3Dia)/3.0;
float P1Mass = pow((P1Dia/D_average), 3)*P1Den;
float P2Mass = pow((P2Dia/D_average), 3)*P2Den;
float P3Mass = pow((P3Dia/D_average), 3)*P3Den;
float minSpeed = 2.0;
float maxSpeed = 3.0;

float P1Xinit = random(D_average, SizeX-D_average);
float P1Yinit = SizeY/4.0;
float P2Xinit = random(D_average, SizeX-D_average);
float P2Yinit = SizeY/2.0;
float P3Xinit = random(D_average, SizeX-D_average);
float P3Yinit = SizeY*3.0/4.0;


float InterDistMin = 55;
float InterDistMax = 88;
float AttrPower = -1.1;
float AttrCoeff = 22.0;
float ReplPower = -0.8;
float ReplCoeff = 16.0;
float TimeStep = 0.5;

Planet P1;
Planet P2;
Planet P3;
Planet PL;
ArrayList planets;


void setup()
{
  size(SizeX, SizeY);
  background(BackgroundColor);
  //frameRate(8);
  smooth();
  P1 = new Planet(P1Color,P1Xinit,P1Yinit,P1Dia,P1Mass);
  P2 = new Planet(P2Color,P2Xinit,P2Yinit,P2Dia,P2Mass);
  P3 = new Planet(P3Color,P3Xinit,P3Yinit,P3Dia,P3Mass);
  planets = new ArrayList();
  planets.add(P1);
  planets.add(P2);
  planets.add(P3);
}


void draw()
{
  interact();

  for (int i=0; i<planets.size(); i++)
  {  
    PL = (Planet) planets.get(i);  
    PL.gogo(TimeStep);
  }
  
  background(BackgroundColor);
  
  for (int j=(planets.size()-1); j>=0; j--)
  {  
    PL = (Planet) planets.get(j);  
    PL.show();
  }
  //delay(100);
}


void interact()
{
  Planet PLA;
  Planet PLB;
  
  for (int p=0; p<planets.size(); p++)
  { 
    PLA = (Planet) planets.get(p);
    
    for (int q=p+1; q<planets.size(); q++)
    {
      PLB = (Planet) planets.get(q);
  
      PVector rAB = PVector.sub(PLA.PlanetCoord, PLB.PlanetCoord);
      float d = rAB.mag();
      if (d < 6.0)
      {  d = 6.0;  } 
  
      if (d < InterDistMax)
      {
        if (d < InterDistMin)
        { float AttrForce = AttrCoeff*pow(d, AttrPower-1); 
          PLA.PlanetVeloc.sub(PVector.mult(rAB, (AttrForce/PLA.PlanetMass)));  
          PLB.PlanetVeloc.add(PVector.mult(rAB, (AttrForce/PLB.PlanetMass)));  }
        else
        { float ReplForce = ReplCoeff*pow(d, ReplPower-1); 
          PLA.PlanetVeloc.add(PVector.mult(rAB, (ReplForce/PLA.PlanetMass)));  
          PLB.PlanetVeloc.sub(PVector.mult(rAB, (ReplForce/PLB.PlanetMass)));  }
      }  
    }
    
    if (PLA.PlanetVeloc.mag() > 10.0)
    {  PLA.PlanetVeloc.div(5.0);  }
    
  }
}


class Planet
{
  color PlanetColor;
  PVector PlanetCoord;
  PVector PlanetVeloc;
  float PlanetDia;
  float PlanetMass;
  
  Planet(color tempC, float tempX, float tempY, float tempDia, float tempMass)
  {
    PlanetColor = tempC;
    PlanetCoord = new PVector(tempX, tempY);
    PlanetDia = tempDia;
    PlanetMass = tempMass;
    PlanetVeloc = new PVector(random(minSpeed, maxSpeed), random(minSpeed, maxSpeed));
  }
  
  
  void gogo(float StepSize)
  {
    PlanetCoord.add(PVector.mult(PlanetVeloc, StepSize));
    
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
    fill(111);
    ellipse(PlanetCoord.x,PlanetCoord.y, 6,6);
  }
}

                                                                                                        
