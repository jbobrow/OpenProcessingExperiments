
//--------------line------------------
float ballRadius=20;
float pointX=0,pointY;
float centerX=0, centerY;
float speed;
//--------------line------------------
//--------------line1------------------
float ballRadius1=20;
float degree;
float pointX1=0,pointY1;
float centerX1=0, centerY1;
float speed1;
float cwOrCww;
//--------------line1------------------
//--------------line2------------------
float ballRadius2=20;
float pointX2=0,pointY2;
float centerX2=0, centerY2;
float speed2;
//--------------line2------------------

void setup()
{
  size(600,400);
  background(250);
  resetLine();
  resetLine1();
  resetLine2();
}

void draw()
{
  
  fill(250,250,250,15);
  rect(0,0,width,height);
  drawLine();
  drawLine1();
  drawLine2();
}





//---------------------function------------------
void drawLine2()
{
  float nextY2,nextX2;
  nextX2=pointX2+speed2;
  nextY2=random(centerY2-ballRadius2,centerY2+ballRadius2);

  line(pointX2,pointY2,nextX2,nextY2);
  pointX2=nextX2;
  pointY2=nextY2;

  if(pointX2>width) 
  {
    resetLine2();
  }
}

//draw the moving circle line
void drawLine1() 
{
  float nextX,nextY,i;

  centerX1+=speed1;
  nextX=centerX1+ballRadius1*cos(degree);
  nextY=centerY1+ballRadius1*sin(degree);
  line(pointX1,pointY1,nextX,nextY);
  
  pointX1=nextX;
  pointY1=nextY;
  degree+=cwOrCww;
  
  if(pointX1>width) resetLine1();
}

// draw the script line
void drawLine()
{
  float nextX,nextY;
  centerX+=speed;
  nextX=random(centerX-ballRadius,centerX+ballRadius);
  nextY=random(centerY-ballRadius,centerY+ballRadius);
  while(DistanceBtw(centerX,centerY,nextX,nextY)>ballRadius)
  {
    nextX=random(centerX-ballRadius,centerX+ballRadius);
    nextY=random(centerY-ballRadius,centerY+ballRadius);
  }
  line(pointX,pointY,nextX,nextY);
  pointX=nextX;
  pointY=nextY;

  if(pointX>width) 
  {
    resetLine();
  }
}

//move the position to left, and assign new value to everything
void resetLine()
{
  pointY=random(ballRadius+5, 400-ballRadius);
  centerY=pointY;
  centerX=0;
  pointX=0;
  speed=random(1,5);
  ballRadius=random(10,60);
}

//move the position to left, and assign new value to everything
void resetLine1()
{
  //smooth();
  degree=0;
  ballRadius1=random(10,30);
  pointY1=random(ballRadius1+5, 400-ballRadius1);
  centerY1=pointY1;
  centerX1=-10;
  speed1=random(1,3);
  
  pointX1=centerX1+ballRadius1;
  int i;
  i=int(random(10))%2;
  
  if(i==0) cwOrCww=random(0.1,0.3);
  else cwOrCww=-1*random(0.1,0.3);
  
}

void resetLine2()
{
  pointX2=0;
  pointY2=random(ballRadius2+5, 400-ballRadius2);
  centerY2=pointY2;
  //centerX=0;
  speed2=random(1,5);
  ballRadius2=random(10,60);
}
//return the length btw (x1,y1) and (x2,y2)
float DistanceBtw(float x1, float y1, float x2, float y2)
{
  return sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
}



