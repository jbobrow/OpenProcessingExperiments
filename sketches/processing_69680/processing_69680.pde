
//Alvin Ha, Repeating Loops, 4-5 Computer Programming

size(400,400);
background(255,255,255);
fill(95,95,95);
rect(0,200,400,200);
fill(2,50,152);
rect(0,0,400,200);
noFill();
smooth();
int x = 0;
int y = 0;
while(x < 251)
{
  stroke(0+x,0+y,0+y);
  strokeWeight(3);
  ellipse(x,y,x,y);
  x = x + 3;
  y = y + 3;
}
