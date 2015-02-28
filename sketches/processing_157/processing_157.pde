
/*
Meander

Date:         2008.03.30
Author:       P.J. Onori

Description:  Modified Processing sketch from Robert Hodgin's Noise Drive (http://flight404.com/p5/noiseDrive2a/).
              Much of code has changed from Robert's original work, but much of the underlying logic still remains.
              Now is a good time to thank Robert for offering up his code for public consumption... :)
*/

import processing.video.*;

MovieMaker mm;

float signature = (random(100));

int xSize = 640;
int ySize = 360;

float xAnchor = xSize/2+random(-xSize/4, xSize/4);
float yAnchor = ySize/2+random(-ySize/4, ySize/4);

Meanderer[] meanderers;

int total = int(random(40, 80));
int delayInterval = int(random(3, 15));
int pushCount = 0;

boolean capture = false;
  
void setup(){
  size(xSize,ySize);
  frameRate(30);
  smooth();
  noFill();
  background(255);
   
  meanderers = new Meanderer[total];
  if(capture) mm = new MovieMaker(this, width, height, signature+"drawing.mov",30, MovieMaker.VIDEO, MovieMaker.BEST);
}

void draw() {

  if(frameCount%delayInterval==1&&pushCount!=total-1||frameCount==0)
  {
    meanderers[pushCount] = new Meanderer(xAnchor, yAnchor);
    pushCount++;
  }
  
  for(int i=0; i<pushCount; i++) meanderers[i].update();
  if(capture) mm.addFrame();
}


void keyPressed(){
   if(capture) 
   { 
    saveFrame(signature+"filename-####.png");
    mm.finish();
   }
    exit();
}

class Meanderer 
{
  int count, seed, d1, toggle, baseAngle;
  float x, y, xSpeed, ySpeed, theta, angle, speed, d2, noiseScale, noiseCount, noiseSpeed, xCount, yCount, angleMultiplier, noiseVal, noiseCompoundX, noiseCompoundY;

  Meanderer (float xPos, float yPos)
  {
    toggle = (random(-1,1)<0) ?-1:1;
    speed = random(.4, 2.5)*toggle;
    count=0;
    seed = int(random(200,1000));
    d1 = int(random(4,9));
    d2 = random(.2,.4);
    noiseScale=random(.01,.03);
    noiseCount=0;
    noiseSpeed=random(.001, .035);
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
    
    float avgSpeed = (xSpeed+ySpeed)/2;
    stroke(0,35/speed);
    ellipse(x,y,40*avgSpeed,40*avgSpeed);
    
    noiseCount+=noiseSpeed;
    xCount+=noiseCompoundX;
    yCount+=noiseCompoundY;
    count++;
  }
}

