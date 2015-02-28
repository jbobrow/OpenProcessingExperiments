
size(500,500);
background(0);
noFill();
stroke(9,155,0);
int x=2;
while(x<483)
{
  ellipse(250,250,x,485-x);
  x=x+20;
}
stroke(255,0,0);
int y=2;
while(y<59)
{
  ellipse(100,100,y,(y*y)/20);
  ellipse(100,400,y,(y*y)/20);
  ellipse(400,400,y,(y*y)/20);
  ellipse(400,100,y,(y*y)/20);
  y=y+8;
}
