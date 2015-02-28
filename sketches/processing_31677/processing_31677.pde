
int counter = 0;

int xpos = 0;
int ypos = 0;

void setup ()
{
  size (500, 500);
  background (255);
  strokeWeight (0);
  noFill ();
  //fill (255,80);
  while ( counter < 500)
  {
    ellipse (xpos, ypos, 60, 60);
    ellipse (xpos, ypos, 80, 80);
    ellipse (xpos, ypos, 40, 40);
    
    counter = counter +1;
    xpos = xpos + 40;
    
    if(xpos > 600){
      ypos = ypos + 40;
      xpos =0;
    }
  }
}


