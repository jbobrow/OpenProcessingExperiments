
int windowSize = 540;
int minimumX = -1;
int maximumX = 1;

  
  int border = 0;
  int windowMin = border;
  int windowMax = windowSize - border;
  
void setup()
{
  size(windowSize,334);
  background(255);

  colorMode(HSB);
  smooth();
  
}

void draw(){
  
  background(#175AA0,100);
  
    noFill();
  stroke(0,0,0);
  rect(windowMin,windowMin,windowMax - windowMin, windowMax-windowMin);

  
    fill(#F7C600);
  
  float yMin = plotFunction(minimumX);
  float yMax = yMin;
  
  for(int screenX = windowMin ; screenX < windowMax ; screenX++)
  {
    float xValue = map(screenX, windowMin, windowMax, minimumX, maximumX);
    float yValue = plotFunction(xValue);
    
    if(yValue < yMin) yMin = yValue;
    if(yValue > yMax) yMax = yValue;
  }
  
  float oldx = 0;
  float oldy = 0;
  
  for(int screenX = windowMin ; screenX < windowMax ; screenX++)
  {
    float xValue = map(screenX, windowMin, windowMax,minimumX,maximumX);
    float yValue = plotFunction(xValue);
    
    float screenY = map(yValue, yMin,yMax,windowMax,windowMin);
    if(screenX > windowMin)
    {
      line(oldx, oldy , screenX,screenY);
    }
    
    oldx = screenX;
    oldy = screenY;
  }
  
    randomSeed(millis() * second());

}

float plotFunction(float x)
{
  return( millis() % random(0,10) / 1000. * cos( second() * x * x + second()/28. % (2*PI)) + sin(x + ((millis()) / 1000. ) % (2 * PI)));
}
