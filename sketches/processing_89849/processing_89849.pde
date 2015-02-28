
void setup()
{
 size(200,200);
 drawShape();
}
void draw()
{
  if(mouseX < width / 2)
   background(255);
  else
   background(0); 
  drawShape();
 
}

void drawShape()
{
 fill(255,255,0);
rect(80,20,40,40);
rect(80,65,40,80);
fill(0,0,255);
ellipse(90,30,10,10);
ellipse(110,30,10,10);
triangle(100,40,90,50,110,50);
fill(255,0,0);
ellipse(100,85,10,10);
ellipse(100,120,10,10);
}

