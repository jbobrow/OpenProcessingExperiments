
int counter = 0;

int xpos = 0;
int ypos = 0;

void setup ()
{
  size (500, 500);
  background (255);
  noFill ();
  fill (255, 100);
  while ( counter < 500)
  {
    ellipse (xpos, ypos, 50, 50);
    ellipse (xpos, ypos, 20, 20);
    counter = counter +1;
    xpos = xpos + 30;
    
    if(xpos > 500){
      ypos = ypos + 30;
      xpos =0;
    }
  }
}


