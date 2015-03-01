
void setup()
{
frameRate(30);
size(450,450);
background(255);
smooth();
noStroke();
}

void draw()
{
   float i=random(5,30);
   fill(0,255,255);
   ellipse(random(width),random(height),i,i);

   fill(255, 25);
   rectMode(CORNER);
   rect(0, 0, width, height);
}  

