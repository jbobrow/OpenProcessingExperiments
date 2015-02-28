
//Winston L, Spin!, CP1, Mods 4-5
//http://www.openprocessing.org/sketch/73145

int a=0;
int b=0;
int c=0;
int e=0;
int f=0;
int g=0;
int h=0;
int i=0;
int j=0;
int w=0;
int x=0;
float y=0;
float z=0.01;

void setup()
{
  size(500, 500, P3D);
}
void draw()
{
  background(e, f, g);
  stroke(i, h, j);
  fill(j, i, h);
  strokeWeight(2);
  ellipse(105+w, 250+x, 25, 25);
  line(105+w, 262+x, 105+w, 290+x);
  line(105+w, 290+x, 90+w, 310+x);
  line(105+w, 290+x, 130+w, 310+x);
  line(105+w, 272+x, 130+w, 262+x);
  line(105+w, 272+x, 130+w, 282+x);
  translate(250, 250);
  fill(255);
  rotateX(5+y);
  rotateY(5+y);
  rotateZ(5+y);
  y=y+z;
  stroke(h, i, j);
  fill(c, a, b);
  lights();
  box(105);
  translate(-250, -250);
  translate(350, 250);
  box(25);
  translate(-350, -250);
  translate(250, 150);
  box(25);
  translate(-250, -150);
  translate(250, 350);
  box(25);
  rotateX(0);
  rotateY(0);
  rotateZ(0);
  translate(-250, -350);
  translate(150, 250);
  sphere(10);
  h=int(random(256));
  i=int(random(256));
  j=int(random(256));
}
void mouseClicked()
{
  e=int(random(256));
  f=int(random(256));
  g=int(random(256));
}
void keyPressed()
{
  if (key=='r')
  {
    e=0;
    f=0;
    g=0;
    a=0;
    b=0;
    c=0;
  }
  if (key=='+')
  {
    z=z+0.01;
  }
  if (key=='-')
  {
    z=z-0.01;
  }
  if (key==' ')
  {
  }
  if (key=='c')
  {
    a=int(random(256));
    b=int(random(256));
    c=int(random(256));
  }
  if (key=='w')
  {
    x=x-10;
  }
  if (key=='s')
  {
    x=x+10;
  }
  if (key=='a')
  {
    w=w-10;
  }
  if (key=='d')
  {
    w=w+10;
  }
}
