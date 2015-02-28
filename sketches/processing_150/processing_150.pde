
int d = 0;
int l = 2;
int c = 3;
PFont infoText;

void setup() 
{
  size(500, 580);
  noStroke();
  smooth();

  infoText = loadFont("HelveticaNeue-48.vlw");

  textFont(infoText, 14);
}

void draw() 
{

  background(255);

  drawCircle(250.0, 250.0, 125.0, l, d, 360); // origin X, origin Y, radius, level inward, degrees roatation, num of total degrees

  if (d < 180 )  d++;
  else {
    
    d = 0;
    
    if (l < 10) 
    {
      l++;
      c = c + (int)(pow(2, l-1));
    }
    else 
    {
      l = 1;
      c = 1;
    }
    
  }
  
  fill(0);
  text("degrees of rotation = " + d*2, 10, 540);
  text("levels of recursion = " + l, 10, 555);
  text("number of circles = " + c, 10, 570);
  text("www.timstutts.com", 375, 570);

}

void drawCircle(float x, float y, float radius, int level, int degreesCircle, int numPoints) 
{             
  
  float tt = level * 20.0;
  fill(tt);
  ellipse(x, y, radius*4, radius*4);  
  
  if(level > 1) 
  {

    level = level - 1;
    degreesCircle = degreesCircle * 2;
    
    float A = degreesCircle * (2*PI/numPoints);
    float CircleAx = cos(A)*radius;
    float CircleAy = sin(A)*radius;
    CircleAx = CircleAx + x;
    CircleAy = CircleAy + y;

    float B = (degreesCircle-(numPoints/2))*(2*PI/numPoints);
    float CircleBx = cos(B)*radius;
    float CircleBy = sin(B)*radius;
    CircleBx = CircleBx + x;
    CircleBy = CircleBy + y;

    drawCircle(CircleAx, CircleAy, radius/2, level, degreesCircle, numPoints);
    drawCircle(CircleBx, CircleBy, radius/2, level, degreesCircle, numPoints);

  }
}

