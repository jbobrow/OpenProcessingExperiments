
//hannah schmitt
//homework 8
//copyright, hannah schmitt, carnegie mellon university, 2012

//drag mouse around on screen to move ellipses around and change colors. 
//click and hold mouse to stop ellipses 
//let go of mouse to have ellipses move again
//continue moving mouse around screen

void setup ()
{
  size (400, 400);
  textSize (24);
  fill (0);
  background(159,208, 250);
}

void draw ()
{
  int x = 300;
  while(x<width)
  {
    ellipse (mouseX,mouseY, random(width),random(height));
    x+=20;
    fill(x, mouseY%255, mouseX%255, 10);
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



