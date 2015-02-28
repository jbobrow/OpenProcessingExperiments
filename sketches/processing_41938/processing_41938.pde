
float x, xTwo, xVel, xVelTwo;
float y, yTwo, yVel, yVelTwo;
int q; //size of rectangle
int r,g,b; //colors for ball one
int rTwo,gTwo,bTwo; //colors for ball two

void setup()
{
  smooth();
  size(500,500);
  q = 20;
  
  x = random(25,475);
  xTwo = random(25,475);
  xVel = random(1,10);
  xVelTwo = random(1,10);
  
  y = random(25, 475);
  yTwo = random(25, 475);
  yVel = random(1,10);
  yVelTwo = random(1,10);


  r = int(random(0,255));  
  g = int(random(0,255));
  b = int(random(0,255));
  rTwo = int(random(0,255));  
  gTwo = int(random(0,255));
  bTwo = int(random(0,255));
}

void draw()
{

  background(150);
  noFill();
  for(int i = 0; i < 500; i+=q)
  { 
    for(int j = 0; j < 500; j+=q)
    {
      rect(i,j,q,q); 
    }
  }
  
  fill(r,g,b);
  ellipse(x,y,50,50);
  fill(rTwo,gTwo,bTwo);
  ellipse(xTwo,yTwo,50,50);
  
  x = x + xVel;
  y = y + yVel;
  
  xTwo = xTwo + xVelTwo;
  yTwo = yTwo + yVelTwo;

  if(x < 25 || x > 475)
  {
    xVel= -xVel;
    q--;
    r = int(random(0,255));  
    g = int(random(0,255));
    b = int(random(0,255));
  }
  
  if(y < 25 || y > 475)
  {
     yVel= -yVel;
     q++;
     r = int(random(0,255));  
     g = int(random(0,255));
     b = int(random(0,255));
  }
  
    if(xTwo < 25 || xTwo > 475)
  {
     xVelTwo= -xVelTwo;
     q--;
    rTwo = int(random(0,255));  
    gTwo = int(random(0,255));
    bTwo = int(random(0,255));
  }
  
  if(yTwo < 25 || yTwo > 475)
  {
     yVelTwo= -yVelTwo;
     q++;
     rTwo = int(random(0,255));  
     gTwo = int(random(0,255));
     bTwo = int(random(0,255));
  }
  

}

