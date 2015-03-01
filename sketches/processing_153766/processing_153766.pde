
void setup()
{
frameRate(2);
size(450,450);
background(255);
smooth();
noStroke();
}

void draw()
{
   fill(255);
   rectMode(CORNER);
   rect(0, 0, width, height);
   float q=random(20,200);
   for(int num = 0; num < q; num++)
  {
    float i=random(5,40);
    fill(0,255,255,random(50,255));
    ellipse(random(width),random(height),i,i);
  }
}  

