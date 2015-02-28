
//By Randall Huynh
Bubble[] b;
int x, y;

void setup()
{
  size(700, 700);
  smooth();
  stroke(500);
  fill(255, 230);

  b = new Bubble[250];
  for (int i=0; i<250; i++)
  {
    b[i] = new Bubble();
    b[i].x = x+random(0,500);
    b[i].y = y+random(0,500);
    b[i].d = 3;
    b[i].v = 5;
    b[i].g=255;
    b[i].bl=255;
  
  

 }
  for(int p=0; p<50; p++)
  {
  b[p].rd=245;
  b[p].g=170;
  b[p].bl=30;
  }
}

void draw()
{
  background(#000000);
  for (int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }
}

class Bubble
{
  float x, y;
  int d, v;
  int rd, g, bl;

  void show()
  {
    ellipse(x, y, d, d);
    fill(rd, g, bl);
    if(x>700)
    {
      x=0;
    }

    if(x<0)
    {
      x=700;
    }
    
    if(y>700)
    {
      y=0;
    }
    
    if(y<0)
    {
      y=700;
    }
    
}

  void move()
  {
    x=x+random(-5,5);
    y=y+random(-5,5);
    x += ( mouseX - width/2  ) * 0.01 * v;
    y += ( mouseY - height/2 ) * 0.01 * v;
  }
}


