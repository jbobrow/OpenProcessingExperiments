
int x=300;
int y=300;
int y1=300;
int x1=300;
int b=0;
int c=1;
void setup()
{
  background(255,255,255);
  size(600, 600);
}
void draw()
{
  noStroke();
  fill(0,0,0,.5);
  rect(0,0,600,600);
  strokeWeight(3);
  smooth();
  stroke(b,255-b,b-255);
  line(b,0,b,600);
  b=b+c;
  if(b>600)
  {
    c=c-1;
  }
  if (b==0)
  {
    c=c+1;
  }
 
  stroke(x, 255, y);
  fill(255,255-x,255-y);
  ellipse(x,y,100,100);
  fill(x,y,150);
  stroke(155,155,x);
  ellipse(600-x,600-y,100,100);
   fill(255-x,255-y,150);
   stroke(x1,155,155);
  ellipse(600-x1,600-y1,100,100);
   fill(x1,0,y1);
  ellipse(x1, y1, 100, 100);
}
void keyPressed()
{
if (key=='w')
{
  fill(x,y,x1);
 rect(0,0,600,600);
}
if (key=='s')
{
 fill(x1,y1,x);
 rect(0,0,600,600);
}
if (key=='a')
{
fill(x,y1,y);
 rect(0,0,600,600);
}
if (key=='d')
{
 fill(y,y,x1);
 rect(0,0,600,600);
}
}
void mouseDragged()
{
  if(mouseButton==LEFT)
  {
    x=mouseX;
    y=mouseY;
}
  if(mouseButton==RIGHT)
  {
    x1=mouseX;
    y1=mouseY;
  }
}



