
//global variables
int x;
int Width;
int Height;
int reset;

void setup()
{
background(0);
size(800,800);
noStroke();
smooth();

Width = 10;
Height = 10;

}
void draw()
{
  reset();
}
void mouseDragged()
{
  Width = Width + 1;
  Height = Height + 1;
  
  int R = (int)(random(255));
  int G = (int)(random(255));
  int B = (int)(random(255));
  
  fill(R, G, B);
  ellipse(mouseX,mouseY, Width,Height);
  if ( Width > 50)
     {
       Width = 50;
     }
  if ( Height > 50)
     {
       Height = 50;
     }
}
void mouseReleased()
 {
  Width = 1;
  Height = 1;
 }
void reset()
{
 fill(255);
 rect(0,0,100,50);
}
void mousePressed()
{
if ((mouseX < 100) && (mouseY < 50))
  {
   background(0);
  }
}

