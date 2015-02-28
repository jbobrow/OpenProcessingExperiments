
PVector[] tabCurrPoints;//current coordinates of the points
PVector[] tabPrevPoints;//previous coordinates of the points
PVector[] tabSpeeds;//speed of each point
final int nbPoints       = 66;//total number of points
final float MAX_SPEED    = 1.8;//max speed of each point
final float MIN_SPEED    = 1.2;//min speed of each point
final float DEFAULT_DIST = 12;//default distance between two consecutive points
final int AUTO_MODE      = 0;
final int MANUAL_MODE    = 1;
final float noiseStepX   = .018;
final float noiseStepY   = .018;
float noiseCurrX   = random(350321);
float noiseCurrY   = random(123456);
int currentMode = MANUAL_MODE;//AUTO_MODE;
MyColor myColor = new MyColor();
int drawMode = (int)random(3);

void setup()
{
  size(700, 500, P2D);
  background(0);
  strokeWeight(1);

  tabPrevPoints = new PVector[nbPoints];
  tabCurrPoints = new PVector[nbPoints];
  tabSpeeds = new PVector[nbPoints];
  for (int i = 0; i < nbPoints; i++)
  {
    tabCurrPoints[i] = tabSpeeds[i] = tabPrevPoints[i] = new PVector(1, 1);
  }
}

void draw()
{
  //progressively erases the stage
  fill(0, 4);
  noStroke(); 
  rect(0, 0, width, height);

  float theta, l_dist, l_deltaDist;

  tabPrevPoints[0] = tabCurrPoints[0].get();
  if (currentMode == MANUAL_MODE)
  {
    //the first point simply follows the mouse
    tabCurrPoints[0] = new PVector(mouseX, mouseY);
  }
  else if (currentMode == AUTO_MODE)
  {
    tabCurrPoints[0] = new PVector(noise(noiseCurrX += noiseStepX)*width, noise(noiseCurrY += noiseStepY)*height);
  }
  stroke(myColor.R, myColor.G, myColor.G); 
   fill(myColor.R-30, myColor.G-30, myColor.G-30, 150);
  for (int i = 1; i < nbPoints; i++)
  {
    l_deltaDist = tabCurrPoints[i].dist(tabCurrPoints[i-1]) - DEFAULT_DIST;

    //each point follows it predecessor
    if (l_deltaDist > 0)
    {
      theta = atan2(tabCurrPoints[i-1].y - tabCurrPoints[i].y, tabCurrPoints[i-1].x - tabCurrPoints[i].x);
      tabSpeeds[i] = new PVector(l_deltaDist * cos(theta), l_deltaDist * sin(theta));
    }
    else
    {
      tabSpeeds[i] = new PVector(0, 0);
    }
    move(i);

    beginShape();
    switch(drawMode)
    {
    case 0:
      vertex(tabCurrPoints[i-1].x, tabCurrPoints[i-1].y);
      vertex(tabPrevPoints[i-1].x, tabPrevPoints[i-1].y);
      vertex(tabPrevPoints[i].x, tabPrevPoints[i].y);
      vertex(tabCurrPoints[i].x, tabCurrPoints[i].y);        
      break;
    case 1:
      vertex(tabCurrPoints[i-1].x, tabCurrPoints[i-1].y);
      vertex(tabCurrPoints[i-1].x - tabSpeeds[i-1].x, tabCurrPoints[i-1].y - tabSpeeds[i-1].y);
      vertex(tabCurrPoints[i].x, tabCurrPoints[i].y);
      break;
    case 2:
      vertex(tabCurrPoints[i-1].x + tabSpeeds[i-1].x, tabCurrPoints[i-1].y + tabSpeeds[i-1].y);
      vertex(tabCurrPoints[i-1].x, tabCurrPoints[i-1].y);                
      vertex(tabCurrPoints[i].x + tabSpeeds[i].x, tabCurrPoints[i].y + tabSpeeds[i].y);
      vertex(tabCurrPoints[i].x, tabCurrPoints[i].y);        
      break;
    }
    endShape();
  }
  myColor.update();
}

//deals with points exiting the stage
void move(int i)
{
  tabPrevPoints[i] = tabCurrPoints[i].get();
  tabCurrPoints[i].add(tabSpeeds[i]);
}

void mousePressed()
{
  currentMode = (currentMode == AUTO_MODE) ? MANUAL_MODE : AUTO_MODE;
}

void keyPressed()
{
  switch(key)
  {
  case '1':
  case '2':
  case '3':
    drawMode = key - 49;
    break;
   
  }
}

class MyColor
{
  float R = random(255);
  float G = random(255);
  float B = random(255);
  float Rspeed = (random(1) > .5 ? 1 : -1) * random(.5, 1.1);
  float Gspeed = (random(1) > .5 ? 1 : -1) * random(.5, 1.1);
  float Bspeed = (random(1) > .5 ? 1 : -1) * random(.5, 1.1);

  void update()
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  } 
}
