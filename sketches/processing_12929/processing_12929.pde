
ArrayList al;
int ballSizeRandomMax = 30;
int numberOfBounces = 3;
void setup()
{
 size(800, 600);
 //smooth();
 al = new ArrayList();
 fill(150);
}
 
void draw()
{
 background(0);
 noStroke();
 if(mousePressed)
 {
   al.add(new movingBall(mouseX, mouseY));
 }
 println("arraylength is " + al.size());
 for(int i=al.size()-1;  i >= 0; i--)
 {
  movingBall mb =  (movingBall) al.get(i);
  mb.disp();
 }
}
 
class movingBall
{
   int s;
   float xMovement;
   float startingX;
   int startingY;
   int bounceCount = 0;
   int direction = 1;
   float rand = random(-1,1);
   boolean maxReached = false;
int speed = 3;
  movingBall(int xpos, int ypos)
  {
   s = ypos-1;
  
   xMovement = xpos;
   startingX = xpos;
   startingY = ypos;
  }
 
  void disp()
  {
    float ballSize = random (0,ballSizeRandomMax);
    for (int i = 0; i<ballSize ; i++)
    {
      fill (random(0,255),random(0,255),random(0,255));
      ellipse(xMovement,s, ballSize-i, ballSize-i);
    }     
   xMovement= xMovement+ rand;
   if (s>startingY*.80 && !maxReached )
   {
     s=s-speed;
   }else
   {   
    maxReached = true;
    s=s+speed;
   }
    if(s>height )
      speed = -speed;
    if(s<0 )
      speed = -speed;
    if(xMovement>width)
      rand = -rand;
    if(xMovement<0)
      rand = -rand; 
     
/*    if(s>height && bounceCount >= numberOfBounces)
      al.remove(this);
    else if(s>height)
    {
      startingY = startingY*2;
      s = startingY;
      bounceCount++;
    }
    else
      s = s*direction +1; */
  }
}
 

