
int counter = 0;

int xpos = 0;
int ypos = 0;

void setup ()
{
  size (500, 500);
  background (255);
  noFill ();

  while ( counter < 500)
  {
    ellipse (xpos, ypos, 50, 50);
    ellipse (xpos, ypos, 100, 100);
    
    counter = counter +1;
    xpos = xpos + 25;
    
    if(xpos > 500){
      ypos = ypos + 25;
      xpos =0;
    }
  }
}


