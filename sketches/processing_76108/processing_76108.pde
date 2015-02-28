
float x2;
float y2;
void setup()
{
   size(400,400); 
}


void draw()
{
  background(255);
  x2=map(mouseX,0,400,100,300);
  y2=map(mouseY,0,400,100,300);
  fill(255,0,0);
  ellipse(x2,y2,20,20);  
}

