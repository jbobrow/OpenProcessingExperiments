
size(500,500);
background(0);

//circles
int y=500;
int x= 0;
while (x<500)
{
  noFill();
  stroke(250,255,0);
  ellipse(x,y,250-x,250-y);
  stroke(0,232,255);
  ellipse(x,x,250-x,250-y);
  x=x+10;
  y=y-10;
}
