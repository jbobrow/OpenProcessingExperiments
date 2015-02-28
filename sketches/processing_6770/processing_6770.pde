

float x, y;
float prevX=0.0, prevY=0.0;
int numOfWaves = 2;
float angle = 0;

void setup()
{
  size(360, 360);
  background(0);
  smooth();
  stroke(255);
}

void draw()
{
  translate(0, height/2);
  scale(1, -1);

  for(int count=0; count < 360; ++count)
  {
    x = count;

    angle = radians(count);
    y = sin(angle*(numOfWaves/2.0));

    y = map(y,-1,1,-height/2,height/2);

    line(prevX, prevY, x, y);

    prevX = x;
    prevY = y;
  }

  prevX = prevY = 0.0;
}

void mouseReleased() 
{
  switch(mouseButton)
  {
  case LEFT:
    numOfWaves = int(mouseX/30.0);
    background(0);
    break;
  }
}



