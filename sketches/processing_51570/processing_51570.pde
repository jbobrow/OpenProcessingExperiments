
int randX= 150;
int randY = 350;
int BlastOff = 0;
float topOfRocket = 200;
float bottomOfRocket = 450;
float dy = 0;
float thrustX = 0;
float thrustY = 0;
float BlastRadius = 0;
int bottom = 500;

void setup()
{
  size(500,500);
  background(0);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(10);
}
void draw()
{
  background(0);
  bottomOfRocket = 450-dy;
  topOfRocket = 200-dy;  
  if(bottomOfRocket > bottom)
  {
    ellipseMode(RADIUS);
    noStroke();
    fill(255,0,0);//Red
    ellipse(200,bottom,BlastRadius,BlastRadius);
    fill(255,160,0);//Orange
    ellipse(200,bottom,BlastRadius*0.7,BlastRadius*0.7);
    fill(255,243,0);//Yellow
    ellipse(200,bottom,BlastRadius*0.5,BlastRadius*0.5);
    BlastRadius += 2;
    topOfRocket = bottom;
    bottomOfRocket = bottom;
    if(BlastRadius > 200)
    {
      noLoop();
      background(0);
    }
  }
  else
  {
    if(mousePressed)
    {
      if(BlastOff == 0)
      {
        BlastOff = 1;
      }
      dy += 3;
      for(int i=0;i<25;i++)
      {    
        thrustX = random(125,275);
        thrustY = random(bottomOfRocket,bottomOfRocket+200);
        fill(random(0,255),0,0);
        ellipse(thrustX + (thrustY-bottomOfRocket)*random(-1.2,1.2),thrustY,10,10);
      }
    }
    else
    {
      if(BlastOff != 0)
      {    
        dy -= 2;
      }
    }
  
    triangle(125,200-dy,275,200-dy,200,100-dy);
    for(int i = 0;i < 15; i++)
    {
      randX= int(random(150,250));
      randY= int(random(topOfRocket,bottomOfRocket));
      fill(sin(random(-1,1))*255,random(-1,1)*255,random(0,255),random(0,255));
      rect(randX,randY,50,50);
    }
  }
}

