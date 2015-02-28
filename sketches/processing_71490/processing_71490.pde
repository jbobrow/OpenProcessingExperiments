
//Michael Huang 16-17 CP1
//User Input

void setup()
{
  size(500,500);
  frameRate(130);
}
void draw()
 {
   stroke(0,255,0);
   fill(255,0,255);
 } 

void mouseDragged()
 {
   if(mouseButton==RIGHT)
   ellipse(500-mouseX,mouseY,pmouseX,pmouseY);
   ellipse(mouseX,mouseY,pmouseX,pmouseY);
   if(mouseButton==LEFT);

 }
