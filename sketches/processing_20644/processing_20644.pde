
int period;
int prevMillis=0;
float x = 0.0;
float numCircles = 1;

void setup()
{
  size(500, 500);
  period = 2000;
  fill(200,0,0);
  background(200);
  noStroke();
}

void draw()
{
  float mX = map(mouseX, 0, width, 0,255);
  float mY = map(mouseY, 0, height, 0, 255);
  float nX = map(mouseX, 0, width, 0,50);
  float nY = map(mouseY, 0, height, 0,50);
  if(millis() - prevMillis >= period)
  {
    for(int i=1; i <= numCircles; i++)
    {
      if(mousePressed)
      {
        fill(mX,mY,mX-mY);
        ellipse(x, height+50-(50*i), nX,nY);
      }
      else
      {
        fill(mX,mY,mX-mY);
        ellipse(x, height+50-(50*i), 50,50);
      }
    }
    x += 50;
    numCircles++;
    prevMillis += period;
  }
}


