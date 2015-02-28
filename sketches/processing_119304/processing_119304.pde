
void setup()
{
  
  size (500, 500);
  background (0);
   
  fill (255, 255, 0);
  noStroke();
  ellipse (0, 0, 150, 150);
  
  stroke (255);
  strokeWeight (4);
  line (0, 490, 500, 490);
  line (0, 470, 500, 470);
  line (0, 440, 500, 440);
  line (0, 400, 500, 400);
  line (0, 350, 500, 350);
  line (0, 300, 500, 300);
  line (0, 240, 500, 240);
  line (0, 160, 500, 160);
  line (0, 80, 500, 80);
 
  
}

void draw()

{
  
  float winkel = map (mouseX, 0, 250, 0, 2*PI);
  rotate (winkel);
  stroke (255);
  strokeWeight (2);
  line (0, 240, 500, 240);
 
}
