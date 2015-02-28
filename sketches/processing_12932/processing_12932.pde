
float xoff = 0.0;
int depthOfBuilding = 10;
boolean withWindow = false;
boolean grassDrawn = false;
ArrayList al;
ArrayList greenBuildingArrayList;
ArrayList grayBuildingArrayList;
ArrayList greenAreaArrayList;
int ballSize = 5;
int numberOfBounces = 3;
int fallSpeed = 10;
PImage img;
 
 
void setup() {
  size(800, 600);
 al = new ArrayList();
 greenBuildingArrayList = new ArrayList();
 grayBuildingArrayList = new ArrayList();
 greenAreaArrayList = new ArrayList();
  drawGrassBits();
  img = loadImage ("rainbow.png");
}
 
 
void draw()
{
  background(141,211,235);
  drawSea();
  if((key == '1')) withWindow = true;
  if((key == '2')) withWindow = false;
  if(greenBuildingArrayList.size()+1>grayBuildingArrayList.size()+1)
  {
    showRainbow();
  }
  if(mousePressed && (mouseButton == LEFT))
  {
    grayBuildingArrayList.add(new drawGrayBuilding(withWindow));
  }
  if(mousePressed && (mouseButton == RIGHT))
  {
    greenBuildingArrayList.add(new drawGreenBuilding(withWindow));
  } 
 
   if(mousePressed)
 {
 }
 
 for(int i=greenAreaArrayList.size()-1;  i >= 0; i--)
 {
  drawGrass mb =  (drawGrass) greenAreaArrayList.get(i);
  mb.init();
 }
 
 for(int i=0;  i <= grayBuildingArrayList.size()-1; i++)
 {
  drawGrayBuilding mb =  (drawGrayBuilding) grayBuildingArrayList.get(i);
  mb.init();
 }
 
 for(int i=0;  i <= greenBuildingArrayList.size()-1; i++)
 {
  drawGreenBuilding mb =  (drawGreenBuilding) greenBuildingArrayList.get(i);
  mb.init();
 }
 
for(int i=al.size()-1;  i >= 0; i--)
 {
  movingBall mb =  (movingBall) al.get(i);
  mb.disp();
 }
 
}
 
void showRainbow()
{
  image(img, 0,0,width,height-height/3);
}
 
void drawGrassBits()
{
  if(!grassDrawn)
  {
    for( int i = 0; i<width; i=i+2)
   {
      drawGrass dg = new drawGrass((int)random(20,80),i);
      greenAreaArrayList.add(dg);
   }
  }
  grassDrawn = true;
}
 
 
void drawSea()
{
  try
  {
    Thread.sleep(0);
  }
  catch(Exception e)
  {
   println(e);
  }
 
  for(int i=1;i<width;i=i+2)
  {
    xoff=xoff+.0000005;
    for(int k=height-height/3; k<height;k = k+2)
    {     
      xoff = xoff+.0005;
      noStroke();
      fill(100,100,random(170,255));  //random blue colour
      rect(random(0,width),k, random(1,10), random(1,10));
    }
  }
}
 
////////////////////////////new class////////////////////////
 
 
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
  movingBall(int xpos, int ypos)
  {
   s = ypos-1;
  
   xMovement = xpos;
   startingX = xpos;
   startingY = ypos;
  }
 
  void disp()
  {
    for (int i = 0; i<ballSize ; i++)
    {
      fill (i*255/ballSize,random(0,255),0);
      ellipse(xMovement,s, ballSize-i, ballSize-i);
    }     
   xMovement= xMovement+ rand;
   if (s>startingY*.80 && !maxReached )
   {
     s=s-fallSpeed;
   }else
   {   
    maxReached = true;
    s=s+fallSpeed;
   }
    if(s>height-height/3 )
      al.remove(this); 
  }
}
class drawGreenBuilding
{        
 
  float randFillRed = random(0,200);
  float randFillGrean = random(0,200);
  float randFillBlue = random(0,200);
  float randWidth = random(20,50);
  float randHeight = random(50,250);
  float randWidthLocation = random(0,width);
  boolean isWindowSelected = false;
  int ballsRepeat = 30;
 
  drawGreenBuilding(boolean bool)
  {
    isWindowSelected = bool;
  }
 
 
  void init()
  {
    for(int i = 0; i<depthOfBuilding; i++)
    {
      fill(randFillRed+50,randFillGrean+50,randFillBlue+50);
      rect(randWidthLocation-i, height-height/3 - i - 15 , randWidth, -randHeight); 
    }
    fill(randFillRed,randFillGrean,randFillBlue);  //random blue colour 
    rect(randWidthLocation, height-height/3 - 15, randWidth, -randHeight); 
   
    if (ballsRepeat!=0)
    {
      ballsRepeat--;
      al.add(new movingBall((int)(randWidthLocation+randWidth/2), (int)(height-height/3-randHeight+10)));
    }
   
    if((key == '1')) withWindow = true;
    if((key == '2')) withWindow = false;
   
    if(isWindowSelected)
    {
      for(int i = 1; i<=randWidth-randWidth/5 ; i ++)
      {
       for (int j = 1; j<= randHeight; j++)
       {
        fill(randFillRed+50,randFillGrean+50,randFillBlue+50);
        rect(randWidthLocation + i, height-height/3 -15 - j , randWidth/5, -randHeight/10);
        j = j+(int)randHeight/10;
       }
       i = i+11;
      }
    }
  }
}
 
 
 
 
class drawGrayBuilding
{       
  float randFill = random(0,200);
  float randWidth = random(20,50);
  float randHeight = random(50,250);
  float randWidthLocation = random(0,width);
  boolean isWindowSelected = false;
  drawGrayBuilding(boolean bool)
  {
    isWindowSelected = bool;
  }
  void init()
  {
    for(int i = 0; i<depthOfBuilding; i++)
    {
      fill(randFill+50);
      rect(randWidthLocation-i, height-height/3 - i - 15 , randWidth, -randHeight); 
    }
    fill(randFill);  //random blue colour 
    rect(randWidthLocation, height-height/3 - 15, randWidth, -randHeight); 
   
 
   
    if(isWindowSelected)
    {
      for(int i = 1; i<=randWidth-randWidth/5 ; i ++)
      {
       for (int j = 1; j<= randHeight; j++)
       {
        fill(randFill+50);
        rect(randWidthLocation + i, height-height/3 -15 - j , randWidth/5, -randHeight/10);
        j = j+(int)randHeight/10;
       }
       i = i+11;
      }
    }
  }
}
 
 
class drawGrass
{
  int ranNo;
  int posX;
  drawGrass(int ran, int pos)
  {
    ranNo = ran;
    posX = pos;
  }
  void init()
  {
  fill(0,255,0);
    rect(posX, height-height/3, 30, -100);
    ellipse(posX, height-height/3-100, 30, -ranNo+30);
  }
}

