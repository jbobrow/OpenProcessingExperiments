
class ppoint
{
  int xpos, ypos;
  
  ppoint(int x, int y)
  {
    xpos = x;
    ypos = y;
  }
}

int rx;
int ry;
int count;
int previouppoint;
float multi;
ppoint pp1;
ppoint pp2;
ppoint pp3;
ppoint pp4;
ppoint pp5;

void setup() 
{
  size(510, 510);
  frameRate(30);
  multi = 0.6;

  noStroke();
  randomsetup();
  
}
void randomsetup()
{
  background(255);
  stroke(0);
  fill(0);
  rx = 5;
  ry = 5;
  previouppoint = 0;
  count = 0;
  //Got the coordinates from this website: http://www.mathopenref.com/coordpolycalc.html
  pp1 = new ppoint(252,52);
  pp2 = new ppoint(62,190);
  pp3 = new ppoint(134,414);
  pp4 = new ppoint(370,414);
  pp5 = new ppoint(442,190);
  
  ellipse(pp1.xpos,pp1.ypos,10,10);
  ellipse(pp2.xpos,pp2.ypos,10,10);
  ellipse(pp3.xpos,pp3.ypos,10,10);
  ellipse(pp4.xpos,pp4.ypos,10,10);
  ellipse(pp5.xpos,pp5.ypos,10,10);
}


void draw() 
{  
  //the count and while loop ppeed up the drawing. After 500 points are created, then they are drawn.
  int count = 0;
  
  while (count < 200)
  {
    int rpoint = int(random(5));
    if (rpoint == 0)// && previouppoint != 2)
    {
      // pentagon point 1
      rx = waverage(rx,pp1.xpos,multi);
      ry = waverage(ry,pp1.ypos,multi);
      stroke(155,0,0);
      fill(155,0,0);
      previouppoint = 0;
    }
    else if (rpoint == 1)// && previouppoint != 3)
    {
      // pentagon point 2
      rx = waverage(rx,pp2.xpos,multi);
      ry = waverage(ry,pp2.ypos,multi);
      stroke(0,155,0);
      fill(0,155,0);
      previouppoint = 1;
    }
    else if (rpoint == 2)// && previouppoint != 4)
    {
      // pentagon point 3
      rx = waverage(rx,pp3.xpos,multi);
      ry = waverage(ry,pp3.ypos,multi);
      stroke(0,0,155);
      fill(0,0,155);
      previouppoint = 2;
    }
    else if (rpoint == 3)// && previouppoint != 0)
    {
      // pentagon point 4
      rx = waverage(rx,pp4.xpos,multi);
      ry = waverage(ry,pp4.ypos,multi);
      stroke(155,0,255);
      fill(155,0,255);
      previouppoint = 3;
    }
    else if (rpoint == 4)// && previouppoint != 1)
    {
      // pentagon point 5
      rx = waverage(rx,pp5.xpos,multi);
      ry = waverage(ry,pp5.ypos,multi);
      stroke(155);
      fill(155);
      previouppoint = 4;
    }
    point(rx,ry);
    count++;
  }
  
}

int waverage(float a, float b, float multiplier)
{
  return int((a*multiplier + b)/(multiplier + 1));
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    multi -= 0.1;
  }
  else if (mouseButton == RIGHT)
  {
    multi += 0.1;
  }
  randomsetup();
}

void keyPressed()
{
  randomsetup();
}

  
