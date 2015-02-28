
import java.util.ArrayList;
ArrayList<FlyLine> beard;
ArrayList<FlyLine> hair;
BounceRectangle lowerlip, upperlip;
TeeterCircles nose;
Spincle border;
boolean move = false;
float i = 0;

void setup()
{
  size(800,800);
  background(255); 
  noStroke();
  lowerlip = new BounceRectangle(400.0,400.0,40,20,60,30,255,153,153);
  upperlip = new BounceRectangle(380.0,380.0,40,20,60,30,255,113,113);
  beard = new ArrayList<FlyLine>();
  hair = new ArrayList<FlyLine>();
  nose = new TeeterCircles(20,400,325,20,15);
  border = new Spincle(100);
  smooth();
  fill(102,153,204);
  rotate(radians(1));
  ellipse(300,800,600,800);
  rotate(radians(-1));
  fill(255,204,153);
  ellipse(400,300,350,400);
  
  //creates random beard and hair starts
  
  //beard grows downish only, not on mouth
  for(int i = 0; i <100; i++)
  {
    beard.add(new FlyLine(random(275,500),random(450,500),random(0,180)));
  }
  for(int i = 0; i <50; i++)
  {
    beard.add(new FlyLine(random(230,300),random(300,450),random(0,180)));
  }
  for(int i = 0; i <50; i++)
  {
    beard.add(new FlyLine(random(500,570),random(300,450),random(0,180)));
  }
  //hair grows upish only, not on eyes
  for(int i = 0; i <150; i++)
  {
    hair.add(new FlyLine(random(230,570),random(80,200)));
  }  
  for(int i = 0; i <75; i++)
  {
    hair.add(new FlyLine(random(230,300),random(200,330)));
  }
  for(int i = 0; i <75; i++)
  {
    hair.add(new FlyLine(random(500,570),random(200,330)));
  }
  
  //draws static elements that will move 
  lowerlip.draw();
  upperlip.draw();
  nose.draw();
  stroke(10);
  FlyLine line; 
  for(int i = 0; i <beard.size(); i++)
  {
    line = beard.get(i);
    line.draw();
  }
  for(int i = 0; i <hair.size(); i++)
  {
    line = hair.get(i);
    line.draw();
  } 
  noStroke();
}

void draw()
{
  //spinning eyes, altercation of Connor Piper's code
  //right eye
  pushMatrix();
  i += 0.1;
  translate(350,250);
  smooth();
  fill(255,0,0);
  rotate(i);
  rect(-10,-10,15,15); 
  translate(-10,-10);
  i += 0.1;
  smooth();
  fill(225,255,155);
  rotate(i);
  rect(-10,-10,20,20);
  popMatrix();
  //left eye
  pushMatrix();
  i += 0.1;
  translate(450,250);
  smooth();
  fill(255,0,0);
  rotate(i);
  rect(-15,-15,20,20); 
  translate(-15,-15);
  i += 0.1;
  smooth();
  fill(225,255,155);
  rotate(i);
  rect(-15,-15,25,25);
  popMatrix();
  
  //dynamic parts, only move after clicking
  if(move)
  {
    FlyLine line;
    
    lowerlip.draw();
    upperlip.draw();
    for(int i = 0; i <beard.size(); i++)
    {
      line = beard.get(i);
      line.draw();
    }
    for(int i = 0; i <hair.size(); i++)
    {
      line = hair.get(i);
      line.draw();
    }
    nose.draw();
    border.draw();
      
  }
}

//toggles moving parts
void mousePressed()
{
    move = !move;
}

//
// TeeterCircles
// creates two paired circles that teeter totter back and forth
//
class TeeterCircles
{
  int diameter, x,xA,xB, y,yA,yB, boundary, offset;
  boolean teeter = false, totter = false;
  

  TeeterCircles(int size, int xPos, int yPos, int distance, int bound)
  {
    diameter = size;
    offset = distance;
    x = xPos;
    xA = xPos+offset;
    xB = xPos-offset;
    y = yPos;
    yA = yPos;
    yB = yPos;
    boundary = bound;
  }  
  
  void draw()
  {
    stroke(10);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(xA, yA, diameter, diameter);
    ellipse(xB, yB, diameter, diameter);
    //reverses each circles y directions if they reach the boundary
    if(teeter)
    {
      yA++;
      yB--;
      if(yA > y+boundary)
      {
        teeter = false;
      }
    }
    else
    {
      yA--;
      yB++;
      if(yB > y+boundary)
      {
        teeter = true;
      }
    }
    //reverses each cicles x direction if they reach half the boundary
   if(totter)
   {
     xA++;
     xB--;
     if(xA > x+offset+(boundary/2))
     {
       totter = false;
     }
   }
   else
   {
     xA--;
     xB++;
     if(xA < x+offset-(boundary/2))
     {
       totter = true;
     }
   }
    noStroke();
  }
}


//
// spincle
// creates 4 circles of random colors that outline a border around the screen
//
class Spincle
{
  int diameter;
  int a = 0, b = 0;
  int c = width, d = 0;
  int e = width, f = height;
  int g = 0, h = height;
  
  Spincle(int size)
  {
    diameter = size;  
  }
  
  void draw()
  {
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(a,b,diameter,diameter);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(c,d,diameter,diameter);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(e,f,diameter,diameter);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(g,h,diameter,diameter);
    //updates positions, resets at edges of screen
    if(b < height && f > 0)
    {
      b+=5;
      f+=-5;
    }
    else
    {
      b=0;
      f=height;
    }
    if(c > 0 && g < height)
    {
      c-=5;
      g+=5;
    }
    else
    {
      c = width;  
      g = 0;
    }
  }
  
}


//
// FlyLine
// creates a line that extends in a direction
//
class FlyLine
{
  float x,y,dir,xOrig,yOrig;
  int counter = 0;
  boolean lock;
  
  FlyLine(float xPos, float yPos, float direction)
  {
    x = xPos;
    xOrig = xPos;
    yOrig = yPos;
    y = yPos;
    dir = direction;
    lock = true;
  }
  FlyLine(float xPos, float yPos)
  {
    x = xPos;
    xOrig = xPos;
    yOrig = yPos;
    y = yPos;
    dir = random(180,360);
    lock = false;
  }
  
  void draw()
  {
    
    y+=sin(radians(dir))/5;
    x+=cos(radians(dir))/5;
    stroke(10);
    line(xOrig,yOrig,x,y);
    noStroke();
    counter++;
    if(counter > 10)
    {
      counter = 0;
      if(lock)
      {
        dir = random(0,180);
      }
      else
      {
        dir = random(180,360);
      }
    }
  }
}
//
// BounceRectangle
// creates a rectangle that bounces between boundaries
//
class BounceRectangle
{
  boolean right = true;
  boolean down = true;
  float x,y;
  int r, g, b, l, w;
  int rBound, lBound,uBound,dBound;
  
  BounceRectangle(float xPos, float yPos, int xBound, int yBound, int lengt, int widt, int rCol, int gCol, int bCol)
  {
    x = xPos;
    y = yPos;
    rBound = int(x+xBound);
    lBound = int(x-xBound);
    uBound = int(y-yBound);
    dBound = int(y+yBound);
    r = rCol;
    g = gCol;
    b = bCol;
    l = lengt;
    w = widt;
  }
  
  void draw() 
  {
    smooth();
    fill(r,g,b);
    rect(x,y,l,w);
    if(right)
    {
      x+= random(.1,1);
    }
    else
    {
      x+= -random(.1,1);
    }
    if(x<lBound)
    {
      x=lBound;
      right = true;
    }
    else if(x>rBound)
    {
      x=rBound;
      right = false;
    }
    if(down)
    {
      y+= random(.1,1);
    }
    else
    {
      y+= -random(.1,1);
    }
    if(y<uBound)
    {
      y=uBound;
      down = true;
    }
    else if(y>dBound)
    {
      y=dBound;
      down = false;
    }
  }


}


