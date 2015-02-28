
class spoint
{
  int xpos, ypos;
  
  spoint(int x, int y)
  {
    xpos = x;
    ypos = y;
  }
}

int rx;
int ry;
int count;
int previouspoint;
float multi;
spoint sp1;
spoint sp2;
spoint sp3;
spoint sp4;

void setup() 
{
  size(510, 510);
  frameRate(30);

  noStroke();
  randomsetup();
  multi = 1.0;
  
}
void randomsetup()
{
  background(255);
  stroke(0);
  fill(0);
  rx = 5;
  ry = 5;
  previouspoint = 0;
  count = 0;
  
  sp1 = new spoint(5,5);
  sp2 = new spoint(width-5,5);
  sp3 = new spoint(width-5,height-5);
  sp4 = new spoint(5,height-5);
  
  ellipse(sp1.xpos,sp1.ypos,10,10);
  ellipse(sp2.xpos,sp2.ypos,10,10);
  ellipse(sp3.xpos,sp3.ypos,10,10);
  ellipse(sp4.xpos,sp4.ypos,10,10);
}


void draw() 
{  
  //the count and while loop speed up the drawing. After 100 points are created, then they are drawn.
  int count = 0;
  while (count < 500)
  {
    int rpoint = int(random(4));
    if (rpoint == 0 && previouspoint != 1)
    {
      // square point 1
      rx = waverage(rx,sp1.xpos,multi);
      ry = waverage(ry,sp1.ypos,multi);
      stroke(155,0,0);
      fill(155,0,0);
      previouspoint = 0;
    }
    else if (rpoint == 1 && previouspoint != 2)
    {
      // square point 2
      rx = waverage(rx,sp2.xpos,multi);
      ry = waverage(ry,sp2.ypos,multi);
      stroke(0,155,0);
      fill(0,155,0);
      previouspoint = 1;
    }
    else if (rpoint == 2 && previouspoint != 3)
    {
      // square point 3
      rx = waverage(rx,sp3.xpos,multi);
      ry = waverage(ry,sp3.ypos,multi);
      stroke(0,0,155);
      fill(0,0,155);
      previouspoint = 2;
    }
    else if (rpoint == 3 && previouspoint != 0)
    {
      // square point 4
      rx = waverage(rx,sp4.xpos,multi);
      ry = waverage(ry,sp4.ypos,multi);
      stroke(155);
      fill(155);
      previouspoint = 3;
    }
    point(rx,ry);
    count++;
  }
  
}

int waverage(float a, float b, float multiplier)
{
  multiplier += ((random(6)-3)/25.0);
  return int((a*multiplier + b)/(multiplier + 1));
}
void keyPressed()
{
  if (key == ' ')
  {
    randomsetup();
    multi = 1;
  }
}
  
void mousePressed()
{
  randomsetup();
  if (mouseButton == LEFT)
  {
    multi -= 0.1;
  }
  else
  {
    multi += 0.1;
  }
}

  
