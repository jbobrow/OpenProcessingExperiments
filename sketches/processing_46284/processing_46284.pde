
/*
Thanks to Ian Dixon for bringing this approach to my attention, and to P.J. Onori
for providing him with code.
*/
 
int windowSize = 600;

int xSize = windowSize;
int ySize = windowSize;
 
 
float maxdTheta = TWO_PI/30;
int nMovers = 2;
CircleMover[] movers;
float diamInit = 50;
float vmin = 1;
float vmax = 3;
int maxTraverses = 0; //number of trips each mover takes. for infinite, 0
boolean polar = true;
boolean decreasingSize = true;
boolean varyColors = true;
boolean transparency = true;
boolean outline = true;
float velocityScaling = 1;
float dThetaScaling = 1;
 
  
void setup()
{
  smooth();
  size(windowSize, windowSize);
  background(165,139,97);
  movers = new CircleMover[nMovers];
  for(int i=0; i<movers.length; i++)
    movers[i] = new CircleMover(windowSize/3,windowSize/2);
}
 
color randomColor()
{
  float alpha = 255;
  if(transparency)
    alpha = random(105,129);
  if(varyColors)
    return color((int)random(81, 250),(int)random(89,209),(int)random(6, 77),alpha);
  else
    return color(25,255,255,alpha);
}
 
void draw()
{
  //background(0);
  for(int i=0; i<movers.length; i++){
    movers[i].display();
    movers[i].move();
  }
}



