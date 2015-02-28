
//Cole Pierce, CP1 4-5
int a=0;
int b=0;
int c=0;
int d=0;
int e=0;
int f=0;
int g=0;
int h=0;
int i=0;
int j=0;
int k=0;
int l=0;
int m=0;
int n=0;
int o=0;
int p=0;
int q=0;
float r=0;
int s=0;
int t=0;
int u=0;
int v=0;
float w=0;
float x=0;
int y=0;
int z=0;

void setup()
{
  size(400, 400);
  /**
   the controls for the 2 people:
   person1:
   w=up
   a=left
   d=right
   s=down
   perons2:
   i=up
   j=left
   l=right
   k=down
   other controls:
   c makes the color change
   t makes the time start
   m makes things move
   f speeds up the movement
   g slows down the movement
   . makes the speed stay the same
   
   by now you must be wondering why you are staring at a black screen,
   println("in order for the blcakness to dissapear you need to type the correct letter");
   println("hint: it is not one of the letters listed above");
   */

  smooth();
  if (y>1)
  {
    draw();
  }
}
void draw()
{

  frameRate(30+r);
  r=r+x;
  background(255, 255, 255);

  fill(0);
  stroke(0);
  ellipse(200-b, 200-a, 20, 20);
  strokeWeight(3);
  line(200-b, 200-a, 200-b, 240-a);
  line(200-b, 220-a, 220-b, 215-a);
  line(200-b, 220-a, 180-b, 215-a);
  line(200-b, 240-a, 215-b, 260-a);
  line(200-b, 240-a, 185-b, 260-a);
  fill(255, 0, 0);
  fill(0);
  stroke(0);
  ellipse(200-s, 200-t, 20, 20);
  strokeWeight(3);
  line(200-s, 200-t, 200-s, 240-t);
  line(200-s, 220-t, 220-s, 215-t);
  line(200-s, 220-t, 180-s, 215-t);
  line(200-s, 240-t, 215-s, 260-t);
  line(200-s, 240-t, 185-s, 260-t);
  fill(255, 0, 0);
  stroke(255-n, 50+n, 50+n);
  fill(255-n, 50+n, 50+n);
  n=n+o;
  if (n>150)
  {
    o=-2;
  }
  if (n<0)
  {
    o=2;
  }
  textSize(30);
  text(u, 320, 350);
  u=u+v;
  if (u>1000)
  {
    v=-1;
  }
  if (u<0)
  {
    v=1;
  }
  ellipse(15+f, 15, 20, 20);
  ellipse(355+h, 255, 20, 20);
  ellipse(155+i, 355, 20, 20);
  ellipse(105+j, 155, 20, 20);
  ellipse(350+p, 75, 20, 20);
  f=f+e;
  h=h+k;
  i=i+l;
  j=j+m;
  p=p+q;
  if (f>375)
  {
    e=-5;
  }
  if (f<-5)
  {
    e=5;
  }
  if (h>30)
  {
    k=-5;
  }
  if (h<-340)
  {
    k=5;
  }
  if (i>225)
  {
    l=-5;
  }
  if (i<-140)
  {
    l=5;
  }
  if (j>275)
  {
    m=-5;
  }
  if (j<-90)
  {
    m=5;
  }
  if (p>30)
  {
    q=-5;
  }
  if (p<-330)
  {
    q=5;
  }
  if (y<1)
  {
    fill(0+y);
    stroke(0);
    quad(1, 1, 0, 400, 400, 400, 400, 0);
  }
  if (z>1)
  {
    fill(255);
    textSize(45);
    text ("try again", 100, 200);
  }
  ellipse(mouseX, mouseY, 10, 10);
  if (mousePressed)
  {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(mouseX, mouseY, 40, 40);
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    a=a+20;
  }
  if (key== 'a')
  {
    b=b+20;
  }
  if (key=='s')
  {
    a=a-20;
  }
  if (key=='d')
  {
    b=b-20;
  }
  if (key == 'i')
  {
    t=t+20;
  }
  if (key== 'j')
  {
    s=s+20;
  }
  if (key=='k')
  {
    t=t-20;
  }
  if (key=='l')
  {
    s=s-20;
  }
  if (key=='t')
  {
    v=1;
  }
  if (key=='c')
  {
    o=2;
  }
  if (key=='m')
  {
    e=5;
    k=5;
    l=5;
    m=5;
    q=5;
  }
  if (key=='f')
  {
    x=.1;
  }
  if (key=='g')
  {
    x=-.05;
  }
  if (key=='.')
  {
    x=o;
  }
  if (key=='x')
  {
    y=5;
  }
  if (key=='z')
  {
    z=5;
  }
  if (key=='v')
  {
    z=5;
  }
  if (key=='q')
  {
    z=5;
  }
  if (key=='e')
  {
    z=5;
  }
  if (key=='r')
  {
    z=5;
  }
  if (key=='y')
  {
    z=5;
  }
  if (key=='u')
  {
    z=5;
  }
  if (key=='o')
  {
    z=5;
  }
  if (key=='p')
  {
    z=5;
  }
  if (key=='b')
  {
    z=5;
  }
  if (key=='n')
  {
    z=5;
  }
}
void keyReleased()
{
  if (key=='z')
  {
    z=0;
  }
  if (key=='v')
  {
    z=0;
  }
  if (key=='q')
  {
    z=0;
  }
  if (key=='e')
  {
    z=0;
  }
  if (key=='r')
  {
    z=0;
  }
  if (key=='y')
  {
    z=0;
  }
  if (key=='u')
  {
    z=0;
  }
  if (key=='o')
  {
    z=0;
  }
  if (key=='p')
  {
    z=0;
  }
  if (key=='b')
  {
    z=0;
  }
  if (key=='n')
  {
    z=0;
  }
}
