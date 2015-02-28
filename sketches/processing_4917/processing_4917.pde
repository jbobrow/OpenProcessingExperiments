
int cX;
int cY;
  
void setup()
{
  size(600, 400);
  frameRate(30);
  background(0);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  cX = round(width/2);
  cY = round(height/2);
}


int offset = 0;
int colorOffset = 0;

//Play with these
int divisor = 9;
int radius = 250;
int masterDistance = 150;
int colorChange = 3;
//

void draw()
{
  fill(0, 0, 0, 10);
  stroke(0,0);
  rect(0, 0, width, height);
  
  offset++;
  offset%=divisor;
  colorOffset+=colorChange;
  colorOffset%=360;
    
  for (int i = 0; i < 360 / divisor; i++)
  {
    float dX;
    float dY;
    float rot = i * divisor + offset;
    float ang = radians(rot);
    float distance = masterDistance + (sin(radians(rot*divisor)) * 50);
    dX = sin(ang);
    dY = cos(ang);
    int mX = mouseX;
    int mY = mouseY;
    stroke((i * divisor + colorOffset)%360, 100, 100, 66);
    strokeWeight(1.5);
    fill(0,0);
    ellipse((dX*distance) + cX, (dY*distance) + cY, radius, radius);
  }
}


