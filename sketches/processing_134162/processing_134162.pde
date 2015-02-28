
class tpoint
{
  int xpos, ypos;
  
  tpoint(int x, int y)
  {
    xpos = x;
    ypos = y;
  }
}

int rx;
int ry;
int count;
float numdrawpoints;
tpoint tp1;
tpoint tp2;
tpoint tp3;

void setup() 
{
  size(610, 610);
  frameRate(30);
  numdrawpoints = 10;

  randomSetup();
  
}

void randomSetup()
{
  noStroke();
  background(255);
  stroke(0);
  fill(0);
  rx = 303;
  ry = 600;
  count = 0;
  
  tp1 = new tpoint(5,600);
  tp2 = new tpoint(605,600);
  tp3 = new tpoint(303,int(600 - 300*sqrt(3)));
  
  ellipse(tp1.xpos,tp1.ypos,10,10);
  ellipse(tp2.xpos,tp2.ypos,10,10);
  ellipse(tp3.xpos,tp3.ypos,10,10);
}
  


void draw() 
{  
  int count = 0;
  while (count < numdrawpoints) //This will create 20 points before it attempts to draw the scene
  {
    int rpoint = int(random(3));
    if (rpoint == 0)
    {
      // triangle point 1
      rx = (rx + tp1.xpos)/2;
      ry = (ry + tp1.ypos)/2;
      stroke(155,0,0);
      fill(155,0,0);
    }
    else if (rpoint == 1)
    {
      // triangle point 2
      rx = (rx + tp2.xpos)/2;
      ry = (ry + tp2.ypos)/2;
      stroke(0,155,0);
      fill(0,155,0);
    }
    else if (rpoint == 2)
    {
      // triangle point 3
      rx = (rx + tp3.xpos)/2;
      ry = (ry + tp3.ypos)/2;
      stroke(0,0,155);
      fill(0,0,155);
    }
    point(rx,ry);
    count++;
  }
  if (numdrawpoints < 120)
  {
    numdrawpoints += (pow(count,0.05)-1);
  }
  
  
}

void keyPressed()
{
  randomSetup();
}

void mousePressed()
{
  randomSetup();
}

