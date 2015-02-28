
int counter = 0;

int xpos = 0;
int ypos = 0;

void setup ()
{
  size (500, 500);
  background (0);
  noFill ();
  fill (255,80);
  while ( counter < 500)
  {
    ellipse (xpos, ypos, 50, 50);
    counter = counter +1;
    xpos = xpos + 30;
    
    if(xpos > 600){
      ypos = ypos + 30;
      xpos =0;
    }
  }
}


