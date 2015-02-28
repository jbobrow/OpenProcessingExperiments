
//kathryn thomas
//homework 4
// copyright 2012

float a,b;
void setup ()
{
  size (400, 400);
  background ( 0,0,0);
  textSize (10);
  fill (220, 57, 20);
  a=200;
  b=200;
 frameRate(100);
 
}

void draw ()
{
smooth();
background(10);  
fill(255,255,255);
ellipse(a,b,100,100);

}

void mouseMoved() {
if (mouseY > 300)
{
 b=b+1;
}
else if (mouseY < 300)
{
 b=b-1;
}
if (mouseX > 300)
{
  a=a+1;
}
else if (mouseX < 300)
{
 a=a-1;
}
}

void mousePressed() {
    fill (255,0,0);
    ellipse (a,b,100,100);
}

void mouseDragged() {
    fill (255,0,0);
    ellipse (b, a, 100, 100);
}



