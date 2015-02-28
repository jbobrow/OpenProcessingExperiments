
float ballRadius1=20;
float degree;
float pointX1=0,pointY1;
float centerX1=0, centerY1;
float speed1;
float cwOrCww;
float acc;
float accIncrease;
boolean getBigger=true;

void setup()
{
  size(1000,400);
  background(10);
  resetLine1();
}


void draw()
{
  drawLine1();
}


void drawLine1() 
{
  float nextX,nextY;
  if(frameCount%193==0)
  {
    centerX1=random(10,width-10);
    centerY1=random(10,height-10);
    stroke(random(55,255),random(55,255),random(55,255));
  }
  
  centerX1+=speed1;
  nextX=centerX1+ballRadius1*cos(degree);
  nextY=centerY1+ballRadius1*sin(degree);
  line(pointX1,pointY1,nextX,nextY);
  
  pointX1=nextX;
  pointY1=nextY;
  degree+=cwOrCww;
  ballRadius1=(ballRadius1+acc);
  acc+=accIncrease;
  if((pointX1>width || pointX1<0) && getBigger)
   {
     accIncrease*=-1;
     acc*=-1;
     getBigger=false;
   }
   if(ballRadius1<1 && !getBigger)
   {
     accIncrease*=-1;
     acc=0;
     getBigger=true;
   }
   
}

void resetLine1()
{
  stroke(random(55,255),random(55,255),random(55,255));
  //smooth();
  degree=0;
  acc=0;
  accIncrease=0.0005;
  centerX1=random(10,width-10);
  ballRadius1=random(0.001,0.005);
  pointX1=centerX1+ballRadius1;
  pointY1=random(10,height-10);
  centerY1=pointY1;
  speed1=0;
  
  int i;
  i=int(random(10))%2;
  
  if(i==0) cwOrCww=random(0.3,0.5);
  else cwOrCww=-1*random(0.3,0.5);
  
}

