
int i;
int r;
void setup()
{
  size(600,600);
  i = 0;
  r = 225;
}

void draw()
{
  if(keyPressed)
  {
    stroke(r);
    strokeWeight(5);
    line(mouseX,mouseY,mouseX,mouseY);
    r = r * 3;          
  }
  if(mousePressed)
  { 
      stroke(100);
      strokeWeight(5);
      line(mouseX,mouseY,mouseX,mouseY);  
  }
 }
 
