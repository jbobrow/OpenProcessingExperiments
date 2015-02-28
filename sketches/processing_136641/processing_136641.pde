
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
tpoint tp1;
tpoint tp2;
tpoint tp3;

void setup() 
{
  size(610, 610);
  frameRate(30);

  noStroke();
  background(255);
  stroke(0);
  fill(0);

  randomsetup();
  
}

void randomsetup()
{
  int pointx = int(random(600));
  int pointy = int(random(600));
  
  rx = pointx;
  ry = pointy;
  
  tp1 = new tpoint(pointx,pointy);
  tp2 = new tpoint(int(random(600)),int(random(600)));
  tp3 = new tpoint(int(random(600)),int(random(600)));
  
  stroke(0);
  fill(0);
  
  ellipse(tp1.xpos,tp1.ypos,10,10);
  ellipse(tp2.xpos,tp2.ypos,10,10);
  ellipse(tp3.xpos,tp3.ypos,10,10);
}


void draw() 
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
  ellipse(rx,ry,1,1);
  
}

void mousePressed()
{
  background(255);
  randomsetup();
}

