
 class Timer
{
  int savedTime;
  int totalTime;
  
  Timer(int tempTotalTime)
  {
    totalTime= tempTotalTime;
  }
  
  void setTime (int t)
  {
    totalTime=t;
  }
  
  void start()
  {
    savedTime=millis();
  }
  
  boolean isFinished()
  {
    int passedTime=millis()-savedTime;
    if (passedTime > totalTime)
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
}

int x;   
int y;  
int A;  
int B;  
int C;  

float flX;   
float flY;   
float pufX;  
float pufY;  
float traceXY = 0.05;

Timer timer;


void setup () 
{
  
  size(500,500);         
  background(0);       
  smooth();
  A = int(random(255));  
  B = int(random(255));  
  C = int(random(255));  
  x = width;             
  y = height;
  
  timer= new Timer(300);
  timer.start();
}

void draw () 
{
  
  pufX = flX;
  pufY = flY;

  flX = flX + traceXY * (mouseX - flX);
  flY = flY + traceXY * (mouseY - flY);

  fill(0,0,0,0); 

  if (mousePressed) 
  {    
   
    A = int(random(255));
    B = int(random(255));
    C = int(random(255));
  }
  else 
  {       
    stroke(A,B,C,50);
    line(pufX,pufY,mouseX,flX+C);
    line(pufX,pufY,mouseX,flX-C);
    curve(pufX+2,pufY+2,mouseX+C,flX+2,mouseY/2,pufY/2,pufX+C,C*2);
    curve(pufX,pufY,mouseX,flX,mouseY,pufX+A,B,C);
  }
  
  if (timer.isFinished())
  {
    timer.start();
  }
  
  if (keyPressed == true)
  {
    timer.setTime(0);
  }
  //println (timer);
 
    
  
  if (keyPressed == true)
  {
    background(0);
  }
}


                
                
