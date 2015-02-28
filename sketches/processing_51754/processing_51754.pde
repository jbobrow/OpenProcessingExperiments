
/* rainMaker 1.3
   Shugo Tanaka
 
 Created: 2/2/2012
 Updated: 2/7/2012
 
 User draws clouds which eventually darken, rain, then fade away.
 Use spacebar to clear screen and reset.
 After no more clouds are on the screen, the sun comes out!
*/

// Global variables: Physics
float gravity = 0.1;
int i, j;

// Global variables: Color constants
int skyTimer = 0;
float bgR = 117;
float bgG = 153;
float bgB = 180;
color bgColor = color(bgR, bgG, bgB);
int x = -250;
float y=(.95)*height;

// Global variables: Clouds
int MAXCLOUDS = 100;
int cloudCurMax = 0;
int cloudColorBase = 245;
int cloudDistSeed = 15;
int cloudSizeSeed = 35;
Cloud[] myCloud = new Cloud[MAXCLOUDS];

// Global variables: Rain
int MAXRAIN = 4900;
int rainCurMax = 0;
int rainSize = 10;
Rain[] myRain = new Rain[MAXRAIN];
int wind = 0;

class Cloud
{
  float largeX;
  float largeY;
  float largeS;
  float smallX;
  float smallY;
  float smallS;
  float cloudC;
  int cloudA;
  int life;

  Cloud(float mouseX_, float mouseY_)
  {
    largeX = mouseX_+random(-cloudDistSeed, cloudDistSeed);
    largeY = mouseY_+random(-cloudDistSeed, cloudDistSeed);
    largeS = random(cloudSizeSeed-10, cloudSizeSeed)+mouseY_*.14;
    smallX = mouseX_+random(-cloudDistSeed-10, cloudDistSeed+10);
    smallY = mouseY_+random(-cloudDistSeed-10, cloudDistSeed+10);
    smallS = random(cloudSizeSeed/2-10, cloudSizeSeed/2)+mouseY_*.14;
    cloudC = random(cloudColorBase-10, cloudColorBase);
    cloudA = 100;
    life = 0;
  }

  void drawCloud()
  {
    noStroke();
    fill(cloudC, cloudC, cloudC, cloudA);
    ellipse(largeX, largeY, largeS, largeS);
    ellipse(smallX, smallY, smallS, smallS);
  }
}

class Rain
{
  float rainX;
  float rainY;
  float rainS;
  int rainC;

  Rain(float cloudX, float cloudY)
  {
    rainX = cloudX;
    rainY = cloudY;
    rainS = 0;
    rainC = int(random(100, 255));
  }

  void drawRain()
  {
    stroke(0, 0, rainC, random(20, 100));
    strokeWeight(3);

    rainY += rainS;
    rainS += gravity;

    if (rainY < (height+10))
    {
      line(rainX, rainY-10, rainX, rainY);
    }
  }
}

void setup()
{
  size(640, 640);
  noStroke();
  ellipseMode(CENTER);
  colorMode(RGB, 255, 255, 255, 100);
  background(bgR, bgG, bgB);
  y=(.95)*height;
}

void draw()
{
  println(skyTimer + " " + y);
  background(bgR, bgG, bgB);

  if (mousePressed)
  {
    x = -100;
    skyTimer = 0;
    makeNewCloud();
  }
  else
  {
    skyTimer++;
  }

  if (skyTimer > 700)
  {
    drawSun();
  }

  // Runs through and draws rain
  for (i = 0; i < rainCurMax;i++)
  {
    myRain[i].drawRain();
  }

  // Runs through and draws clouds
  for (i = 0; i< cloudCurMax;i++)
  {
    // Darken cloud
    if ((100 < myCloud[i].life) && (myCloud[i].life < 250) && (myCloud[i].cloudC > 40))
    {
      myCloud[i].cloudC--;
      if (bgR > 17)
        bgR -= .035;
      if (bgG > 53)
        bgG -= .035;
      if (bgB > 80)
        bgB -= .035;
    }

    // Rain cloud
    if ((255 < myCloud[i].life) && (myCloud[i].life < 300))
    {
      makeNewRain(myCloud[i].largeX, myCloud[i].largeY);
    }

    // Fade cloud
    if ((myCloud[i].life > 300) && (myCloud[i].cloudA>=0))
    {
      myCloud[i].cloudA--;
      if (bgR < 117)
        bgR += .02;
      if (bgG < 153)
        bgG += .02;
      if (bgB < 180)
        bgB += .02;
    }

    myCloud[i].drawCloud();
    if (myCloud[i].life < 400)
    {
      myCloud[i].life++;
    }
  }
}

void makeNewCloud()
{
  myCloud[cloudCurMax] = new Cloud(mouseX, mouseY);
  cloudCurMax++;
  if (cloudCurMax == MAXCLOUDS-1)
  {
    cloudCurMax = 0;
  }
}

void makeNewRain(float cloudX, float cloudY)
{
  myRain[rainCurMax] = new Rain(cloudX, cloudY);
  rainCurMax++;

  if (rainCurMax == MAXRAIN-1)
  {
    rainCurMax = 0;
  }
}

void drawSun()
{
  fill(bgR, bgG, bgB);
  if(y>= 300)
  {
    ellipse(x-2, y-1, 250, 250);
  }
  else
  {
    ellipse(x-2,y,250,250);
  }
  fill(255, 255, 0);
  ellipse(x, y, 250, 250);
  x+=2;
  if(y>= 300)
  {
    y-= .75;
  }
  else
  {
    y-= .1;
  }
  if (x > width+250)
  {
    x=-250;
    y = (.95)*height;
    skyTimer = 0;
  }
}

// Clear the sky
void keyPressed()
{
  if (key == ' ')
  {
    bgR = 117;
    bgG = 153;
    bgB = 180;
    background(bgR, bgG, bgB);
    cloudCurMax = 0;
    rainCurMax = 0;
    skyTimer = 0;
    x=-250;
    y=(.95)*height;
  }
}


