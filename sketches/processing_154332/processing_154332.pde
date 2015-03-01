
void setup()
{ background(255);
  size(500, 500);
  smooth();
}

void draw()
{
  if(mousePressed)
  {
   stroke(0);
 
  }
  else
  {
    noFill();
    noStroke();
  }
  line( mouseX, mouseY, 250, 250);
  
}

    
