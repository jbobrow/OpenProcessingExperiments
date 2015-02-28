
//Matt Dawson
//madawson@andrew.cmu.edu
//hw8
//copyright matt dawson, carnegie mellon university, 10/31/12, all rights reserved


float a,b,c;
 
 
void setup ()
{
  size (400, 400);
  textSize (24);
  fill (0);
  background(255);
  frameRate(20);
 
}
 
void draw ()
{
 
  int x = 300;
  while(x<width)
  {
    rect(random(width),random(height), random(width/4),random(height/4));
    x+=20;
    fill(a%255,b%255,c%255, 15);
    if(0<mouseX && mouseX<133)
    {
      a=random(0,255);
      b=0;
      c=0;
    }
    if(133<mouseX && mouseX<266)
    {
      a=0;
      b=random(0,255);
      c=0;
    }
    if(266<mouseX && mouseX<400)
    {
      a=0;
      b=0;
      c=random(0,255);
    }
    
//    if(frameCount%100==0)
//    {
//      fill(255);
//      rect(0,0,width,height);
//    }
  }
}

void keyPressed()
{
if (keyCode == ENTER)
 {
 background(0);
 }
else
 {
 background(255);
 }
}
   
   
   
    
void mousePressed()
{
  noLoop();
}
 
void mouseReleased ()
{
  loop ();
}

