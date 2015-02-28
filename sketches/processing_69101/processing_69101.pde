
//William Lee, Repeating Shape, CP1, Block 6


size(800,600);
background(118,99,114);
noFill();
smooth();
strokeWeight (5);
stroke(178,124,166);
int x3 = 50;
int y3 = 20;
while(x3 < 800)
{
  ellipse(380,y3,100,100);
  x3 = x3 + 5;
  y3 = y3 + 10;
}
stroke(175,122,164);
int x4 = 10;
int y4 = 20;
while(x4 < 800)
{
  ellipse(x4,280,100,100);
  x4 = x4 + 20;
  
}
stroke(219,177,210);
int x2 = 10;
int y2 = 70;
while(x2 < 800)
{
  ellipse(x2,500+y2,100,100);
  x2 = x2 + 20;
  y2 = y2 - 15;
}
stroke(240,177,210);
int x = 10;
int y = 70;
while(x < 800)
{
  ellipse(x+20,y-25,100,100);
  x = x + 21;
  y = y + 15;
}
