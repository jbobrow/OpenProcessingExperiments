
void setup()
{
  size(500,500);
  noStroke();
  fill(0);
  smooth();
}

void draw()
{
  background(20,150,200);
  
  if (mousePressed==false)
  {
    stroke(191,239,255);
    line(pmouseX,pmouseY,pmouseX/2,pmouseY/2);
  }
  
  else
  {
    float a=random(20);
    float b=random(100);
    float c=random(255);
    
    stroke(a,b,c);
    line(pmouseX,pmouseY,a,b);
  }
}
