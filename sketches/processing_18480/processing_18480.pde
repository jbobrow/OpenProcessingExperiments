
int total = 200;
int [] xPos = new int[total];
int [] yPos = new int[total];
int [] radius = new int[total];


void setup()
{
  size(400,400);

  setupCircles();

  smooth();
}


void draw()
{
  background(0,197,255);
  for( int i = 0; i < total; i++)
  {

    fill(255,255,255,255);
    stroke(0,255);
    for( int j = 0; j < total; j++)
    {
      float radiusSq = ( radius[i]/2.0+radius[j]/2.0)*( radius[i]/2.0+radius[j]/2.0);
      if( j==i) continue;
      int xDist = xPos[i]-xPos[j];
      int yDist = yPos[i]-yPos[j];
      int distancesq = (xDist*xDist)+(yDist*yDist);
      if(distancesq < radiusSq ) {
        fill(255,255,255,80);
        stroke(0,80);
        break;
      }
    }
    ellipse(xPos[i],yPos[i],radius[i],radius[i]);
  }
}


void keyPressed()
{
  setupCircles();
}


void setupCircles()
{
  for( int i = 0; i < total; i++)
  {
    xPos[i] = int( random(0,width) );
    yPos[i] = int(random(0,height) );
    radius[i] = int(random(10,50) );
  }
}


