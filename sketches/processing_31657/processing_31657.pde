
int counter = 0;

int xpos = 0;
int ypos = 0;

void setup ()
{
  size (500, 500);
  background (0);
  strokeWeight (4);
  noFill ();
  fill (255,80);
  while ( counter < 500)
  {
    ellipse (xpos, ypos, 70, 70);
    
    counter = counter +1;
    xpos = xpos + 50;
    
    if(xpos > 600){
      ypos = ypos + 50;
      xpos =0;
    }
  }
}


