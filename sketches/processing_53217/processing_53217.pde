
float minT = 0;
float maxT = 200*PI;
int numPoints = 10000;
float deltaT = (maxT-minT)/numPoints;
int bigR = 100;
int smallR = 35;
boolean keyMode = false;
boolean rainbow = false;

void draw()
{
  float lastX=0, lastY=0;
  colorMode(RGB, 255);
  background(150);
  stroke(0);
  fill(0);
  if (!keyMode)
  {
    bigR = mouseY;
    smallR = mouseX;
    text("Mouse mode", width-100, 20);
  }
  else
    text("Key mode", width-100, 20);

  text("r", 10, 10);
  drawArrow(20, 5, 50, 0);
  text(smallR, 30, 20);

  text("R", 0, 25);
  drawArrow(5, 30, 50, 90);
  text(bigR, 10, 50);

  text("Use arrow keys to switch to key mode, ", 10, height-30);
  text("C to toggle rainbow mode.  Any other key: back to mouse mode", 10, height-15);

  for (float t = minT; t < maxT; t = t + deltaT)
  {
    if (rainbow)
    {
      colorMode(HSB, 100);
      stroke((int)(t)%100, 100, 100); // Color red
    }
    else
      stroke(255, 0, 0);
    float currX = (bigR-smallR)*sin(t)-smallR*sin( bigR*t/smallR-t)+width/2;
    float currY = (bigR-smallR)*cos(t)+smallR*cos( bigR*t/smallR-t)+height/2;
    if (t != minT)
      line(lastX, lastY, currX, currY);
    lastX = currX;
    lastY = currY;
  }
}
//-------------------------------------------
void setup()
{
  size(400, 400);
  colorMode(HSB, 100);
}
//-------------------------------------------
void drawArrow(int cx, int cy, int len, float angleDegrees) 
{
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angleDegrees));
  line(0, 0, len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}
//-------------------------------------------
void keyPressed()
{
  if (key == CODED) { 
    keyMode = true;
    switch(keyCode) {
    case UP: 
      bigR++;
      break;
    case DOWN: 
      bigR--;
      break;
    case LEFT: 
      smallR--;
      break;
    case RIGHT: 
      smallR++;
      break;
    }
  }
  else
  {
    if (key == 'c' || key == 'C')
      rainbow = !rainbow;
    keyMode=false;
  }
}

