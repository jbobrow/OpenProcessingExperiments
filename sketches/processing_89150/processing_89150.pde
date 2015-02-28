
void setup()
{
  size (500, 500);
}

void draw () {
  //  background (200,20,0);
  if (((mouseX > width/2 +10) || (mouseX < width/2 -10)) && ((mouseY > height/2 +10) ||( mouseY < height/2 -10)))
  {

    goCharacters( 20, 100, 50);
  }

  else
  {
    winkEye(100, 200, 130);
  }
}

void goCharacters(int r, int g, int b)
{

  fill (r, g, b);
  background (200, 20, 0);
  ellipse (width/5, height/4, width/10, width/10);
  ellipse (width*8/10, height/4, width/10, width/10);
  rectMode (CENTER); 
  rect(width/2, height/2, width/10, width/10);
  line (width/10, height*8/10, width*9/10, height*8/10);
}
void winkEye(float r, float b, float g)
{


  fill (r, g, b);
  background (200, 20, 0);
  ellipse (width/5, height/4, width/10, width/10);
  line (width*7/10, height/4, width*8/10, height*2/10);
  line (width*7/10, height/4, width*9/10, height/4);
  line (width*7/10, height/4, width*8/10, height*3/10);
  rect (width* 5/10, height/2, width/10, width/10);
  arc (250, 400, 400, 100, 0, PI);
}
