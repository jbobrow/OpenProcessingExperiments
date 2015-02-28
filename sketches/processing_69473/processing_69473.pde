
//Jordan Leung, Repeating Loops, 4,5, Computer Programing

size(500,500);
background(110,49,98);
noFill();
smooth();

int x=0;
int y=0;
while(x<400)
{
  strokeWeight(10);
  stroke(255,255,255,50);
  ellipse(250,250,x,y);
  stroke(27,12,170,255);
  strokeWeight(1);
  ellipse(250,250,y,x);
  stroke(142,113,21);
  ellipse(250,250,50+x,y+200);
  x=x+10;
  y=y+5;
}
