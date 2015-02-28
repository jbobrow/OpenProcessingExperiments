
//flash math(s) 03 linesAndBlobs extension
//allonestring
//april 2011

//pjs - july 2014

float xpos, ypos;
float oldxpos, oldypos;
float minx, maxx, miny, maxy;
float lineLength;
float radius, angle;
int counter;

void setup()
{
  size(400, 400);
  background(255);
  frameRate(6);
  smooth();
  
  counter = 1;
  
  minx = 40;
  maxx = width - 40;
  miny = 40;
  maxy = height - 40;
  
  radius = 150;
  
  oldxpos = (width / 2);
  oldypos = (height / 2);
}

void draw()
{
  fill(255, 10);
  noStroke();
  rect(0, 0, width, height);
  
  if(counter % 2 == 0)
  {
    angle = random(TWO_PI);
//    angle += PI / 4;
    lineLength = random(30, 70);
    strokeWeight(lineLength / 2);
    float strokeAlpha = (70 - lineLength) * (255/40);
    stroke(0, 64, 96, strokeAlpha);
    
    chooseNewPositions();
    
//    if(xpos < minx) xpos = minx;
//    if(xpos > maxx) xpos = maxx;
//    if(ypos < miny) ypos = miny;
//    if(ypos > maxy) ypos = maxy;
    
    line(oldxpos, oldypos, xpos, ypos);
    
    oldxpos = xpos;
    oldypos = ypos;
  }
  else
  {
    fill(0);
    float circleSize = random(5, 10);
    ellipse(oldxpos, oldypos, circleSize, circleSize);
  }
  counter++;
}

void chooseNewPositions()
{
  xpos = oldxpos + cos(angle) * lineLength;
  ypos = oldypos + sin(angle) * lineLength;
  float dx = width / 2 - xpos;
  float dy = height / 2 - ypos;
  float distance = sqrt(dx*dx + dy*dy);
  if(distance > radius)
  {
    xpos = width / 2;
    ypos = height / 2;
  }
  else return;
}



