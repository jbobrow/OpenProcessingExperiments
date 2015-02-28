
int maxIterations = 12;
int currentTree = 0;
int numTrees = 5;

void setup()
{
  size(800,600);
  //noLoop();
  frameRate(0.5);
  smooth();
  
}

void draw()
{
  background(255,255,255);
  for(currentTree = 0; currentTree < numTrees; currentTree++)
    {
    for(int pass = 0; pass < 18; pass++)
    {
      fill(0,60);
      rect(0,0,width,height);
      noFill();
      drawLine(random(30*currentTree,width-30*currentTree),(float)height,1, 0);
    }
  }
}

void drawLine(float x, float y, int iteration, float angle)
{
  float rndAngle,finalAngle;
  float spawnChance = random(10, maxIterations-iteration);
  if((spawnChance<15 && iteration<maxIterations) || iteration == 1)
  {
    rndAngle = random(-PI-HALF_PI/iteration,-HALF_PI/iteration);
    if(iteration==1)
    {
      finalAngle=rndAngle;
    }
    else
    {
      finalAngle = (rndAngle+angle)/2;
    }
    float newx = (float)(maxIterations-iteration)*iteration*cos(finalAngle)+x;
    float newy = (float)(maxIterations-iteration)*10*sin(finalAngle)+y;
    strokeWeight(constrain((float)maxIterations-(float)iteration*2,1,5));
    stroke(100-5*iteration,iteration*9+20+20,0, 255-(10*iteration)/(currentTree+1));
    line(x,y,newx,newy);
    drawLine(newx,newy,iteration+1, finalAngle);
  }
  spawnChance = random(10, maxIterations-iteration);
  if((spawnChance<15 && iteration<maxIterations) || iteration == 1)
  {
    rndAngle = random(-HALF_PI,HALF_PI/iteration);
    if(iteration==1)
    {
      finalAngle=rndAngle;
    }
    else
    {
      finalAngle = (rndAngle+angle)/2;
    }
    float newx = (float)(maxIterations-iteration)*iteration*cos(finalAngle)+x;
    float newy = (float)(maxIterations-iteration)*10*sin(finalAngle)+y;
    strokeWeight(constrain((float)maxIterations-(float)iteration*2,1,5));
    stroke(100-5*iteration,iteration*8+30+20,0, 255-(10*iteration)/(currentTree+1));
    line(x,y,newx,newy);
    drawLine(newx,newy,iteration+1, finalAngle);
  }
}

