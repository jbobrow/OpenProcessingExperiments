
float accX=0,accY=0; // acceleration
float mass=300; //ball mass
float ballX,ballY; //ball position
float velX=0,velY=0;
float k=1; //k: spring constant
float springX,springY; //spring location
float dampingFriction=10;
int circleRadius=200;

int burning=0; //color value
boolean fading=true; 

void setup()
{
  size(800,600);
  background(255);
  velX=0;
  springX=300;
  springY=height/2;
  ballX=100;
  ballY=height/2;
  
}


void draw()
{
  Fading();
  //background(255);
  
  //BurningUpdate();
  //stroke(burning,velX*90/20,velY*90/20);
  fill(0,0,0,0);
  ballX=MovingDistance(ballX,velX);
  ballY=MovingDistance(ballY,velY);
  //print(" x:"+ballX);
  stroke(50);
  ellipse(ballX,ballY,circleRadius-abs(velY)*10,circleRadius-abs(velX)*10);
  
  accX=AccelerationFormula(HooksLaw(ballX,springX,DistanceBtw(ballX,springX)),velX);
  accY=AccelerationFormula(HooksLaw(ballY,springY,DistanceBtw(ballY,springY)),velY);
  SpringLocationUpdate();
  VelocityUpdate();
  
  LineCrossing();
  
}





//------function---------
void BurningUpdate()
{
  if(burning<=((int)velX+(int)velY)*50 && burning<90)
  {
    burning+=2;
  }
  if(frameCount%2==0 && burning>50) burning--;
}

void keyPressed()
{
  if(fading) fading=false;
  else fading=true;
}

void Fading()
{
  if(fading)
  {
    fill(255,255,255,10);
    rect(0,0,width,height);
  }
}

float MovingDistance(float currentPosition, float velocity)
{
  return currentPosition+=velocity;
}

void LineCrossing()
{
  stroke(255);
  /*
  if(frameCount%4==0) line(random(0,width),0,0,random(0,height));
  else if(frameCount%4==3) line(width,random(0,height),random(0,height),height);
  else if(frameCount%4==2) line(random(0,width),0,random(0,width),height);
  else if(frameCount%4==1) line(0,random(0,height),width,random(0,height));
 
  for(int i=0; i<2;i++)
  {
    line(random(0,width),0,0,random(0,height));
    line(width,random(0,height),random(0,height),height);
    line(random(0,width),0,random(0,width),height);
    line(0,random(0,height),width,random(0,height));
  }
   */
}


//------Spring formula-------------
/*---------------------------------
F=m*a --> a=F/m
a= -k*x/m
*/
float AccelerationFormula(float force, float vel)
{
  return (force-dampingFriction*vel)/mass;
  //if damping friction =0. the spring will never stop;
}

// Force=-k*x   k: spring constant   x:displacement of the spring's end from its equilibrium position
float HooksLaw(float ball,float spring, float x)
{
    if(ball<spring) 
    { 
      return (k*x);
    }
    else return -(k*x);
}

void VelocityUpdate()
{
  velX+=accX;
  velY+=accY;
}

float DistanceBtw(float x1, float y1)
{
  return abs(x1-y1);
}

void SpringLocationUpdate()
{
  springX=mouseX;
  springY=mouseY;
}

