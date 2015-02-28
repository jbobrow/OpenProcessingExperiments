
//lighting made by Esteban Hufstedler on http://www.openprocessing.org/sketch/2924#

PImage mjolnir;
float x;
float y;
float mjolnirCharge = 0;
boolean up, down, left, right;

int width = 800;
int height = 500;


float maxDTheta = PI/10;
float minDTheta = PI/20;
float maxTheta = PI/2;
float childGenOdds = .01;

float minBoltWidth = 3;
float maxBoltWidth = 10;

float minJumpLength = 1;
float maxJumpLength = 10;

boolean stormMode = true;
boolean fadeStrikes = true;
boolean randomColors = false;
float maxTimeBetweenStrikes = 2000;

color boltColor;
color skyColor;


lightningBolt bolt;
float lastStrike = 0;
float nextStrikeInNms = 0;

boolean playThunder = false;
boolean useDing = false;
float meanDistance = 0;
ArrayList thunderTimes = new ArrayList();



void setup()
{
  size(800, 500);
  background(0);
  mjolnir = loadImage("mjolnir.png");
  colorMode(HSB, 100);
  smooth();
  noFill();
  meanDistance = 1000*.5;
  boltColor = color(0, 0, 99);
  skyColor = color(0, 0, 10, 20);
  background(skyColor);
  bolt = new lightningBolt(random(0, width), 0, random(minBoltWidth, maxBoltWidth), 0, minJumpLength, maxJumpLength, boltColor);
}

void draw()
{
  println("x: " + mouseX + " y: " + mouseY);
  
  if (mjolnirCharge == 1)
  {
    background(0);
    image(mjolnir, 0+x, 220+y, 100, 66.7);
  }
  //background(0);
  if (mjolnirCharge == 0)
  {
    background(0);
    image(mjolnir, 0+x, 220+y, 100, 66.7);
  }
  checkMovement();
  checkRange();

  println(y);

  if (playThunder && thunderTimes.size() > 0)
    if (millis() > (Float)thunderTimes.get(0)) {
      thunderTimes.remove(0);

      println("boom!");
    }

  if (stormMode && millis()-lastStrike>nextStrikeInNms) {//time for a new bolt?
    lastStrike = millis();
    nextStrikeInNms = random(0, maxTimeBetweenStrikes);

    if (mjolnirCharge == 0)
    {
      bolt = new lightningBolt(random(0, width), 0, random(minBoltWidth, maxBoltWidth), 0, minJumpLength, maxJumpLength, boltColor);
      bolt.draw();
    }

    if (mjolnirCharge == 1)
    {
      bolt = new lightningBolt(x+80, 253+y, random(minBoltWidth, maxBoltWidth), random(-100, 100), minJumpLength, maxJumpLength, boltColor);
      bolt.draw();

      bolt = new lightningBolt(random(0, width), 0, random(minBoltWidth, maxBoltWidth), 0, minJumpLength, maxJumpLength, boltColor);
      bolt.draw();
    }

    if (playThunder)
      thunderTimes.add(bolt.getThunderTime());
  }
  else {
    if (fadeStrikes) {
      noStroke();
      fill(skyColor);
      rect(0, 0, width, height);
      noFill();
    }
  }
}

int randomSign() //returns +1 or -1
{
  float num = random(-1, 1);
  if (num==0)
    return -1;
  else
    return (int)(num/abs(num));
}

color randomColor() {
  return color(random(0, 100), 99, 99);
}

color slightlyRandomColor(color inputCol, float length) {
  float h = hue(inputCol);
  h = (h+random(-length, length))%100;
  return color(h, 99, 99);
}

void keyPressed()
{
  if (key == 'w')
  {
    up = true;
  }

  if (key == 's')
  {
    down = true;
  }

  if (key == 'a')
  {
    left = true;
  }

  if (key == 'd')
  {
    right = true;
  }

  if (key == ' ')
  {
    mjolnirCharge = 1;
    maxTimeBetweenStrikes = 200;
  }
}

void keyReleased()
{
  if (key == 'w')
  {
    up = false;
  }

  if (key == 's')
  {
    down = false;
  }

  if (key == 'a')
  {
    left = false;
  }

  if (key == 'd')
  {
    right = false;
  }
}

void checkMovement()
{
  if (up && right)
  {
    x +=7;
    y -=5;
  }

  else if (up && left)
  {
    x -=3;
    y -=5;
  }

  else if (down && right)
  {
    x +=7;
    y +=5;
  }

  else if (down && left)
  {
    x -=3;
    y +=5;
  }

  else if (up)
  {
    y -=5;
  }

  else if (down)
  {
    y +=5;
  }

  else if (left)
  {
    x -=3;
  }

  else if (right)
  {
    x +=7;
  }
}

void checkRange()
{
  if (y >= 235)
  {
    y -=5;
  } 

  if (y <= -235)
  {
    y +=5;
  }

  if (x <= -25)
  {
    x +=3;
  }

  if (x >= 710)
  {
    x -=7;
  }
}

class lightningBolt {
  float lineWidth0, theta, x0, y0, x1, y1, x2, y2, straightJump, straightJumpMax, straightJumpMin, lineWidth;
  color myColor;
  lightningBolt(float x0I, float y0I, float width0, float theta0, float jumpMin, float jumpMax, color inputColor) {

    lineWidth0 = width0;
    lineWidth = width0;
    theta = theta0;
    x0 = x0I;
    y0 = y0I;
    x1 = x0I;
    y1 = y0I;
    x2 = x0I;
    y2 = y0I;
    straightJumpMin = jumpMin;
    straightJumpMax = jumpMax;
    myColor = inputColor;
    //it's a wandering line that goes straight for a while,
    //then does a jagged jump (large dTheta), repeats.
    //it does not aim higher than thetaMax
    //(where theta= 0 is down)
    straightJump = random(straightJumpMin, straightJumpMax);
  }

  //tells when the thunder should sound.
  float getThunderTime() {
    return (millis()+meanDistance*(1+random(-.1, .1)));
  }

  void draw()
  {
    while (y2<height && (x2>0 && x2<width))
    {
      strokeWeight(1);

      theta += randomSign()*random(minDTheta, maxDTheta);
      if (theta>maxTheta)
        theta = maxTheta;
      if (theta<-maxTheta)
        theta = -maxTheta;

      straightJump = random(straightJumpMin, straightJumpMax);
      x2 = x1-straightJump*cos(theta-HALF_PI);
      y2 = y1-straightJump*sin(theta-HALF_PI);

      if (randomColors)
        myColor = slightlyRandomColor(myColor, straightJump);

      lineWidth = map(y2, height, y0, 1, lineWidth0);
      if (lineWidth<0)
        lineWidth = 0;
      stroke(myColor);
      strokeWeight(lineWidth);
      line(x1, y1, x2, y2);
      x1=x2;
      y1=y2;

      //think about making a fork
      if (random(0, 1)<childGenOdds) {//if yes, have a baby!
        float newTheta = theta;
        newTheta += randomSign()*random(minDTheta, maxDTheta);
        if (theta>maxTheta)
          theta = maxTheta;
        if (theta<-maxTheta)
          theta = -maxTheta;
        //        nForks++;
        (new lightningBolt(x2, y2, lineWidth, newTheta, straightJumpMin, straightJumpMax, boltColor)).draw();
        //it draws the whole limb before continuing.
      }
    }
  }
}



