
ArrayList wormholes;

float targetX;
float targetY;

void setup()
{
  smooth();
  wormholes = new ArrayList();
  size(640, 480);
  frameRate(30);
  targetX = width*0.5;
  targetY = height*0.5;
}

void draw()
{
  background(0);
  
  //mouse easing
  targetX -= (targetX - mouseX)*0.05;
  targetY -= (targetY - mouseY)*0.05;
  
   Wormhole w1 = new Wormhole(targetX,targetY, true);
   w1.spinTarget = -0.05*(targetX - mouseX);
   w1.strokeColor = color(random(100,200));
   
   if(random(0,100)<2)
   {
     w1.strokeColor = color(26,235,27,150);
     w1.strokeSize = 3;
   }
   
   if(mousePressed)
   {
     if(mouseButton == LEFT)
     {
       w1.isSquare = false;
     }
   }
   
   wormholes.add(w1);
  
  for(int i=0; i<wormholes.size(); i++)
  {
    Wormhole tempW = (Wormhole) wormholes.get(i);
    
    tempW.update();
    
    //delete wormholes once they reach a certain size
    if(tempW.diamX > width*2)
    {
      wormholes.remove(i);
      i--;
    }
  }
  
  //print(wormholes.size() + " | ");
}

class Wormhole
{
  boolean isSquare;
  float xPos;
  float yPos;
  float diamX = 1;
  float diamY = 1;
  float spinTarget = 0;
  float angleValue = 0;
  float strokeSize = 1;
  
  color strokeColor;
  
  Wormhole(float x, float y, boolean square)
  {
    isSquare = square;
    xPos = x;
    yPos = y;
  }
  
  void update()
  {
    angleValue += (spinTarget-angleValue)*0.01;
    
    stroke(strokeColor,200);
    strokeWeight((diamX*diamX)/(width*20)*strokeSize);
    noFill();
    diamX+=diamX/7;
    diamY+=diamY/7;
    pushMatrix();
    translate(xPos,yPos);
    rotate(angleValue);
   
    if(!isSquare)
    {
      ellipse(0,0,diamX,diamY);
    }
    else
    {
      rect(-diamX/2,-diamY/2,diamX,diamY); 
    }
    
    popMatrix();
  }
}

