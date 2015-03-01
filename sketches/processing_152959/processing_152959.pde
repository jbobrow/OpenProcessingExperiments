
//Por Óscar A. Montiel :). (Basado en un ejemplo, pue'... LOL).

int [] xpos=new int[50];
int [] ypos=new int[50];
int c1=int(random(255));
int c2=int(random(255));
color c3=color(random(255), random(255), random(255));
int tam=int(random(10, 15));
String tex1;
Snake s1;
Snake s2;
Snake s3;

void mouseReleased()
{
  c1=int(random(255));
  c2=int(random(255));
  tam=int(random(2,20));
  if (c1==c2)
  {
    c2=int(random(255));
    textSize(15);
    fill(0);
    
    rect(0, 590, 15, 15);
  }
  c3=color(random(255), random(255), random(255));
}

void setup()
{
  for (int i=0; i<xpos.length;i++)
  {
    xpos[i]=0;
    ypos[i]=0;
  }

  noCursor();

  smooth();
  size(800, 600);
  background(0);
}

void draw()
{
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  s1=new Snake(c1, 200);
  s2=new Snake(c2, 100);
  s3=new Snake(c3, tam);

  for (int i=0;i<xpos.length-1;i++)
  {
    xpos[i]=xpos[i+1];
    ypos[i]=ypos[i+1];
  }

  xpos[xpos.length-1]=mouseX;
  ypos[ypos.length-1]=mouseY;


  s1.ver();
  s2.ver();
  s3.ver();
}

class Snake
{
  color c;
  int t;

  Snake(float tC, int tT)
  {
    c=(int)tC;
    t=tT;
  }

  void ver()
  {
    for (int i=0;i<xpos.length;i++)
    {
      noStroke();
      fill(c);
      ellipse(xpos[i], ypos[i], i+t, i+t);
    }
  }
}



