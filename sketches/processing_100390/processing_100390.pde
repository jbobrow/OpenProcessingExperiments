
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/100390*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
Sal Spring
allonestring.co.uk
June 2013

playing with rotating systems
a node garden version
*/

Satellite[] satellites;
int numSats = 53;

int minOrbitalRad = 70;
int maxOrbitalRad = 270;
float minOrbitalVel = -0.015;
float maxOrbitalVel = 0.015;


void setup()
{
  size(550, 550);
  background(0);
  smooth();
  
  satellites = new Satellite[numSats];
  for(int s = 0; s < numSats; s++)
  {
    float thisOrbitRad = random(minOrbitalRad, maxOrbitalRad);
    float thisOrbitRot = random(0, TWO_PI);
    float thisOrbitRotInc = random(minOrbitalVel, maxOrbitalVel);
    
    satellites[s] = new Satellite(thisOrbitRad, thisOrbitRot, thisOrbitRotInc);
    satellites[s].colour = color(random(64, 192), random(64, 192),random(64, 192));
  }
}

void draw()
{
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);

  for(int s = 0; s < numSats; s++)
  {
    satellites[s].update();
    satellites[s].display();
  }
  springSats();

  popMatrix();
}

void springSats()
{
  for(int s = 0; s < numSats - 1; s++)
  {
    for(int t = s + 1; t < numSats; t++)
    {
      satellites[s].springTo(satellites[t]);
    }
  }
}

class Satellite
{
  float orbitalRad, orbitalRot, orbitalVel;
  float posx, posy;
  color colour;
  float spring = 0.00025;
  float minAngle = 0.2 * PI;
  float friction = 0.95;
  float minVelLimit = -0.05;
  float maxVelLimit = 0.05;

  Satellite(float orbitalRad, float orbitalRot, float orbitalVel)
  {
    this.orbitalRad = orbitalRad;
    this.orbitalRot = orbitalRot;
    this.orbitalVel = orbitalVel;
    this.colour = colour;
    findPosition();
  }

  void display()
  {
    noStroke();
    fill(colour);
    pushMatrix();
    translate(posx, posy);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }

  void update()
  {
    orbitalVel *= friction;
    orbitalRot += orbitalVel;
    orbitalRot %=  TWO_PI;
    if (orbitalRot < 0) orbitalRot += TWO_PI;
    findPosition();
  }

  void springTo(Satellite otherOne)
  {
    float drot = abs(orbitalRot - otherOne.orbitalRot);
    //then, in case we need to test below and above TWO_PI
    float temprot1 = (orbitalRot + PI) % TWO_PI;
    float temprot2 = (otherOne.orbitalRot + PI) % TWO_PI;
    float drot2 = abs(temprot1 - temprot2);
    if (drot < minAngle)
    {
      doSpringStuff(otherOne, drot);
    }
    else if (drot2 < minAngle)
    {
      doSpringStuff(otherOne, drot2);
    }
  }

  void doSpringStuff(Satellite otherOne, float angleDiff)
  {
    float alfa = map(angleDiff, 0, minAngle, 255, 0);
    strokeWeight(3);
    stroke(getAverageColour(otherOne), alfa);
    line(posx, posy, otherOne.posx, otherOne.posy);
    float acc = angleDiff * spring;
    orbitalVel = min(orbitalVel += acc, maxVelLimit);
    otherOne.orbitalVel = max(otherOne.orbitalVel -= acc, minVelLimit);
  }

  color getAverageColour(Satellite otherOne)
  {
    float redbit = abs(red(colour) + red(otherOne.colour))/2;
    float greenbit = abs(green(colour) + green(otherOne.colour))/2;
    float bluebit = abs(blue(colour) + blue(otherOne.colour))/2;
    return color(redbit, greenbit, bluebit);
  }

  void findPosition()
  {
    posx = orbitalRad * cos(orbitalRot);
    posy = orbitalRad * sin(orbitalRot);
  }
}



