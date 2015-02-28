
/*
Roots

Date:         2009.01.09
Author:       DrIan - Minor Modification of Origninl P.J. Onori Code

Description:  Modified (Minor Changes) from Processing sketch by P.J. Onori - Meander (http://www.openprocessing.org/visuals/?visualID=157) 
              This is P.J Onori Code modified to produce a differnet effect in this case growing 'roots' which tapper in size and grow darker as the 'root'
              travels further from the central generation point. The Completed rendering has a woodcut quality to it
              
              All credit goes to P.J Onori as I don't code just modify and play around with the work of others to produce something different.             
*/

int xSize = 500;
int ySize = 500;

float xAnchor = 250;
float yAnchor = 250;

Meanderer[] meanderers;

int total = int(random(70, 100));
int delayInterval = int(random(3, 15));
int pushCount = 0;

void setup(){
  size(xSize,ySize);
  frameRate(60);
  smooth();
  noFill();
  background(255); 
  meanderers = new Meanderer[total];
  stroke(0,0,0,25);
  strokeWeight(5);
  ellipse(250,250,495,495);
 } 

void draw()
{
   if(frameCount%delayInterval==1&&pushCount!=total-1||frameCount==0)
   {
     meanderers[pushCount] = new Meanderer(xAnchor, yAnchor);
     pushCount++;
   }
  for(int i=0; i<pushCount; i++) meanderers[i].update();
}

class Meanderer 
{
  int count, seed, d1, toggle, baseAngle;
  float travel, dx, dy, x, y, xSpeed, ySpeed, theta, angle, speed, d2, noiseScale, noiseCount, noiseSpeed, xCount, yCount, angleMultiplier, noiseVal, noiseCompoundX, noiseCompoundY;

  Meanderer (float xPos, float yPos)
  {
    toggle = (random(-1,1)<0) ?-1:1;
    speed = random(0.6, 1.5)*toggle;
    count=0;
    seed = int(random(200,1000));
    d1 = int(random(4,9));
    d2 = random(.2,.4);
    noiseScale=random(.01,.03);
    noiseCount=0;
    noiseSpeed=random(.001, .01);
    xCount=int(random(-10, 10));
    yCount=int(random(-10, 10));
    angleMultiplier = random(.3,.9);
    baseAngle = int(random(2,4))*360;
    noiseCompoundX=random(.1,.3);
    noiseCompoundY=random(.1,.3);
      
    x = xPos;
    y = yPos;
  }

  void update()
  {
    noiseDetail(d1, d2);
    noiseSeed(seed);
    noiseVal=noise((x-xCount)*noiseScale, (y-yCount)*noiseScale, noiseCount);
    
    angle -= (angle - noiseVal*baseAngle)*angleMultiplier;
    theta = -(angle * PI)/180;
    xSpeed = cos(theta)*speed;
    ySpeed = sin(theta)*speed;
    
    x -= xSpeed;
    y -= ySpeed;
    
    if(x>xAnchor)dx=x-xAnchor;
    if(y>yAnchor)dy=y-yAnchor;
    if(x<xAnchor)dx=xAnchor-x;
    if(y<yAnchor)dy=yAnchor-y;
    travel = sqrt (dx*dx + dy*dy);
        
    float avgSpeed = (xSpeed+ySpeed)/2;
    stroke(0,0,0,5*travel/10);
    strokeWeight(1);
    fill(255,255,255,55);
    if(50-travel/5>1)
    {
    ellipse(x,y,50-travel/5,50-travel/5);
    }
    noiseCount+=noiseSpeed;
    xCount+=noiseCompoundX;
    yCount+=noiseCompoundY;
    count++;
  }

}

