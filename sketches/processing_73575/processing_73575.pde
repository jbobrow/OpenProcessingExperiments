
int x=300;
int y=300;
int hori=10;
int vert=10;
int change=5;
int go=590;
int stop=590;
int var=400;
int sol=400;
int g=100;
int h=100;
int m=250;
int n=250;
int e=255;
int r=255;
int t=255;
int randNum=int(random(0,51));
void setup()
{
  size(600,600);
  background(0,0,0);
}
void draw()
{
  squarething();
  cool();
  man();
  purp();
  stroke(255,255,255);
  fill(255,255,255);
  ellipse(x,y,30,30);
  fill(0,0,0,15);
  rect(0,0,600,600);
  
}
void keyPressed()
{
  if(key=='w')
  {
    y=y-20;
  }
  if(key=='s')
  {
    y=y+20;
  }
  if(key=='a')
  {
    x=x-20;
  }
  if(key=='d')
  {
    x=x+20;
  }
}
void mousePressed()
{
  if(mouseButton==LEFT)
  {
    background(e,r,t);
    
  }
}
void squarething()
{
  stroke(255,0,0);
  fill(255,0,0);
  ellipse(hori,vert,10,10);
  hori=hori+change;
  vert=vert+change;
  frameRate(20);
  if (hori>600)
  {
    change=-randNum;
  }
  if (hori<0)
  {
    change=randNum;
  }
  if (vert>600)
  {
    change=-randNum;
  }
  if (vert<0)
  {
    change=randNum;
  }
}

void cool()
{
  stroke(0,255,0);
  fill(0,255,0);
  ellipse(var,sol,20,20);
  int direction=int(random(0,4));
  if(direction==0)
  {
    var=var+20;
  }
  else if(direction==1)
  {
    var=var-20;
  }
  else if(direction==2)
  {
    sol=sol+20;
  }
  else
  {
    sol=sol-20;
  }
}
void man()
{
  stroke(0,0,255);
  fill(0,0,255);
  ellipse(g,h,20,20);
  int direction=int(random(0,4));
  if(direction==0)
  {
    g=g+20;
  }
  else if(direction==1)
  {
    g=g-20;
  }
  else if(direction==2)
  {
    h=h+20;
  }
  else
  {
    h=h-20;
  }
}
void purp()
{
  stroke(107,7,147);
  fill(107,7,147);
  ellipse(m,n,20,20);
  int direction=int(random(0,4));
  if(direction==0)
  {
    m=m+20;
  }
  else if(direction==1)
  {
    m=m-20;
  }
  else if(direction==2)
  {
    n=n+20;
  }
  else
  {
    n=n-20;
  }
}
  
  
  
  

