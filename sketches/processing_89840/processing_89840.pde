
void setup()
{
  size(200,200);
}
void draw()
{
if(mouseX<=width/2)
{
  background(255,255,255);
}
else if(mouseX>width/2) background(0,0,0);
fill(252,241,0);
rect(80,40,40,40);
rect(80,90,40,80);
fill(0,0,255);
triangle(100,60,90,70,110,70);
ellipse(90,50,5,5);
ellipse(110,50,5,5);
fill(255,0,0);
ellipse(100,110,5,5);
ellipse(100,140,5,5);
}

