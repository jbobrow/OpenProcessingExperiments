
size(800,600);
background(0);
noFill();
strokeWeight(1);
stroke(0,255,0);
int x = 10;
while (x < 200)
{
  
  ellipse(300-x,300,400-x,400-x);
  ellipse(500+x,300,400-x,400-x);
  ellipse(400-x,300+x,400-x,400-x);
  ellipse(400-x,300-x,400-x,400-x);
  ellipse(400+x,300+x,400-x,400-x);
  ellipse(400+x,300-x,400-x,400-x);
  ellipse(400,300+x,400-x,400-x);
  ellipse(400,300-x,400-x,400-x);
  x=x+3;
  stroke(255,0,0);
  
}
