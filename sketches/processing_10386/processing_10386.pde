
float[][] shipVector={{0,-3},{-2,2},{0,1},{2,2}};
float[][] fireVector1={{0,1},{-1,1.5},{0,3},{1,1.5}};
float[][] fireVector2={{0,1},{-1,1.5},{0,4},{1,1.5}};
float[][] planetVector;
float[] directionVector={0,0};
boolean leftButton=false,rightButton=false,upButton=false,fireButton=false, aButton=false, zButton=false;
float turningSpeed=0.015;                    
float currentAngle=0;
float[] momentum={0,0};
float[] currentPosition={0,0};
float[] cameraPosition={0,0};
float thrust=0.05;
float gasLevel=0;
boolean currentFireVector=false;
int numberOfBodies=50;

float[] windowSize={640,480};
float viewScale=1;
float viewingDistance=(getDistance(windowSize,cameraPosition)/2.0);

float[][] stellarBodies; //={
//{700,240,2*5,2*100,0,0,255},
//{30,400,2,30,255,128,255}
//}; //[number][x,y,mass,radius,r,g,b]

float generatePlanetColor()
{
  return 128+random(128);
}

void populateUniverse()
{
  boolean safeDistance=false; 
  for(int i=0;i<numberOfBodies;i++)
  {
    float[] bodyPosition={0,0};
    float bodySize=random(15)+1;
    float mass=bodySize*3;
    float radius=bodySize*100;
    while(!safeDistance||getDistance(bodyPosition,currentPosition)-radius*10<250)
    {
      bodyPosition[0]+=random(radius)-radius/2;
      bodyPosition[1]+=random(radius)-radius/2;
      safeDistance=true;
      for(int y=0;y<i;y++)
      {
        if(getDistance(bodyPosition,stellarBodies[y])-radius*10<stellarBodies[y][3])safeDistance=false;
      }
      
    }
    stellarBodies[i][0]=bodyPosition[0];
    stellarBodies[i][1]=bodyPosition[1];
    stellarBodies[i][2]=mass;
    stellarBodies[i][3]=radius;
    stellarBodies[i][4]=generatePlanetColor();
    stellarBodies[i][5]=generatePlanetColor();
    stellarBodies[i][6]=generatePlanetColor();
  }
}

void setup()
{
  stellarBodies=new float[numberOfBodies][7];
  planetVector = new float[50][2];
  populateUniverse();
  size(int(windowSize[0]),int(windowSize[1]));
  frameRate(60);
  preparePlanetVector();
}

void drawStellarBodies()
{
  //viewingDistance
  for(int i=0;i<stellarBodies.length;i++)
  {
    if((getDistance(cameraPosition,stellarBodies[i]))<(viewingDistance+stellarBodies[i][3])/viewScale)
      drawVector(stellarBodies[i][0], stellarBodies[i][1], 0.0, stellarBodies[i][3], planetVector, color(stellarBodies[i][4],stellarBodies[i][5],stellarBodies[i][6])); 


  }
}

void preparePlanetVector()
{
  for(int i=0;i<50;i++)
  {
    planetVector[i][0]=sin(i*6.28/50);
    planetVector[i][1]=cos(i*6.28/50);
  }
}

void calculateFriction()
{
  if(momentum[0]>0)momentum[0]-=gasLevel; else
  if(momentum[0]<0)momentum[0]+=gasLevel;
  if(momentum[1]>0)momentum[1]-=gasLevel; else
  if(momentum[1]<0)momentum[1]+=gasLevel;
}
void calculateGravitationalPull()
{
  float gravitationalPull;
  float[] pullDirection={0,0};
  float xDistance,yDistance;
  float distance;
  for(int i=0;i<stellarBodies.length;i++)
  {

    distance=getDistance(stellarBodies[i],currentPosition)+1;
    gravitationalPull=stellarBodies[i][2]/distance;
    pullDirection[0]=(currentPosition[0]-stellarBodies[i][0])/distance*gravitationalPull;
    pullDirection[1]=(currentPosition[1]-stellarBodies[i][1])/distance*gravitationalPull;
    momentum[0]-=pullDirection[0];
    momentum[1]-=pullDirection[1];
    
    stroke(0,255,0);
  }
}

float getDistance(float[] point1, float[] point2)
{
  return sqrt((point1[0]-point2[0])*(point1[0]-point2[0])+(point1[1]-point2[1])*(point1[1]-point2[1]));
}

void setCameraPosition()
{
  cameraPosition[0]=currentPosition[0];//+momentum[0]*-15;
  cameraPosition[1]=currentPosition[1];//+momentum[1]*-15;
}

float[] rotatePoint(float[] point, float angle)
{
  angle*=6.28;
  float[] returnValue={0,0};
  returnValue[0]=cos(angle)*point[0]-sin(angle)*point[1];
  returnValue[1]=sin(angle)*point[0]+cos(angle)*point[1];
  
  return returnValue;
}

float[] calculateDirectionVector(float angle)
{
  angle+=0.125;
  angle*=6.28;
  float[] returnValue= {0,0};
  returnValue[0]=cos(angle)-sin(angle);
  returnValue[1]=sin(angle)+cos(angle);
  
  return returnValue;
}

void movePlayerShip()
{
  currentPosition[0]+=momentum[0];
  currentPosition[1]+=momentum[1];
}

void drawVector(float x, float y, float angle, float vectorSize, float[][] vector, color vectorColor)
{
  x*=viewScale;
  y*=viewScale;
  vectorSize*=viewScale;
  x-=+cameraPosition[0]*viewScale-windowSize[0]/2.0;
  y-=+cameraPosition[1]*viewScale-windowSize[1]/2.0;
  float[] point1={0,0};
  float[] point2={0,0};
  stroke(vectorColor);
  if(angle!=0)point1=rotatePoint(vector[0],angle); else
  point1=vector[0];
  
  for(int i=0;i<vector.length-1;i++)
  { 
    if(angle!=0)point2=rotatePoint(vector[i+1],angle); else
    point2=vector[i+1];
    
    line(point1[0]*vectorSize+x,point1[1]*vectorSize+y,point2[0]*vectorSize+x,point2[1]*vectorSize+y);
    point1=point2;
  }
  point1=rotatePoint(vector[0],angle);
  point2=rotatePoint(vector[vector.length-1],angle);
  line(point1[0]*vectorSize+x,point1[1]*vectorSize+y,point2[0]*vectorSize+x,point2[1]*vectorSize+y);
}

void drawAbsoluteVector(float x, float y, float angle, float vectorSize, float[][] vector, color vectorColor)
{
  float[] point1={0,0};
  float[] point2={0,0};
  stroke(vectorColor);
  if(angle!=0)point1=rotatePoint(vector[0],angle); else
  point1=vector[0];
  
  for(int i=0;i<vector.length-1;i++)
  { 
    if(angle!=0)point2=rotatePoint(vector[i+1],angle); else
    point2=vector[i+1];
    
    line(point1[0]*vectorSize+x,point1[1]*vectorSize+y,point2[0]*vectorSize+x,point2[1]*vectorSize+y);
    point1=point2;
  }
  point1=rotatePoint(vector[0],angle);
  point2=rotatePoint(vector[vector.length-1],angle);
  line(point1[0]*vectorSize+x,point1[1]*vectorSize+y,point2[0]*vectorSize+x,point2[1]*vectorSize+y);
}

void drawPlayer()
{
  drawVector(currentPosition[0]+momentum[0]*-3,currentPosition[1]+momentum[1]*-3,currentAngle,5,shipVector,color(32,32,0));
  drawVector(currentPosition[0]+momentum[0]*-2,currentPosition[1]+momentum[1]*-2,currentAngle,5,shipVector,color(64,64,0));
  drawVector(currentPosition[0]+momentum[0]*-1,currentPosition[1]+momentum[1]*-1,currentAngle,5,shipVector,color(128,128,0));
  if(upButton)
  if(currentFireVector)
  {
    drawVector(currentPosition[0],currentPosition[1],currentAngle,5,fireVector1,color(255,0,0));
    currentFireVector=false;
  } else {
    drawVector(currentPosition[0],currentPosition[1],currentAngle,5,fireVector2,color(255,0,0));
    currentFireVector=true;
  }
  drawVector(currentPosition[0],currentPosition[1],currentAngle,5,shipVector,color(255,255,0));
}

void draw()
{
  
  directionVector=calculateDirectionVector(currentAngle);
  if(leftButton)currentAngle-=turningSpeed;
  if(rightButton)currentAngle+=turningSpeed;
  
  if(currentAngle>1-turningSpeed)currentAngle=0;
  if(currentAngle<0)currentAngle=1-turningSpeed;
  if(upButton)
  {
    momentum[0]-=directionVector[0]*thrust;
    momentum[1]-=directionVector[1]*thrust;
  }
  
  background(0);
  updateZoom();
  setCameraPosition();
  calculateFriction();
  calculateGravitationalPull();
  movePlayerShip();
  drawStellarBodies();
  drawPlayer();
  drawHUD();
}

void keyPressed()
{
  if (key == CODED)
  {
    if(keyCode==LEFT)leftButton=true;
    if(keyCode==RIGHT)rightButton=true;
    if(keyCode==UP)upButton=true;
    if(keyCode==CONTROL)fireButton=true;
  } else
  if (key == 's' || key == 'A')aButton=true;
  if (key == 'x' || key == 'Z')zButton=true;

}

void keyReleased()
{
  if (key == CODED)
  {
    if(keyCode==LEFT)leftButton=false;
    if(keyCode==RIGHT)rightButton=false;
    if(keyCode==UP)upButton=false;
    if(keyCode==CONTROL)fireButton=false;
  }
  if (key == 's' || key == 'S')aButton=false; //viewScale+=0.005; else
  if (key == 'x' || key == 'X')zButton=false; //viewScale-=0.005;
}

void updateZoom()
{
  if(aButton)viewScale+=0.005;
  if(zButton)viewScale-=0.005;
  if(viewScale<0.005)viewScale=0.005;
  if(viewScale>1)viewScale=1;
}

void drawHUD()
{
  drawAbsoluteVector(20,20,0,15,planetVector,color(0,255,0));
  drawAbsoluteVector(20,20,currentAngle,5,shipVector,color(0,255,0));
  drawAbsoluteVector(620,20,0,15,planetVector,color(255,255,0));
  drawAbsoluteVector(620,20,atan2(currentPosition[1],currentPosition[0])/PI,5,shipVector,color(255,255,0));
}

