
// Matheson G. Computer Programming 1 Mods:14/15 
size(300,300);
noFill();
background(0);
smooth();
stroke(247,240,12);
int y=10;
while(y<300)
{ 
  rect(150,150,y,y);
  rect(150-y,150-y,y,y);
  y=y+10;
}
int w=10;
stroke(255);
while(w<150)
{
  ellipse(150,150,w,w);
  w=w+10;
}
