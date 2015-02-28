
void setup ()
{
  size (500, 500);
  background (0);
  
}

void draw ()
{
  background (0);
  stroke (250, 200, 50);
  line (40, 0, 10, 500);
  
  stroke (255);
  line (80, 0, 10, 500);
  line (120, 0, 10, 500);
  line (160, 0, 10, 500);
  line (200, 0, 10, 500);
  line (240, 0, 10, 500);
  line (280, 0, 10, 500);
  line (320, 0, 10, 500);
  line (360, 0, 10, 500);
  line (400, 0, 10, 500);
  line (440, 0, 10, 500);
  line (480, 0, 10, 500);


  translate (mouseX/2, 0);
  pushMatrix ();
  stroke (250, 200, 50);
  line (20, 0, 10, 500);
  stroke (255);
  line (60, 0, 10, 500);
  line (100, 0, 10, 500);
  line (140, 0, 10, 500);
  line (180, 0, 10, 500);
  line (220, 0, 10, 500);
  line (260, 0, 10, 500);
  line (300, 0, 10, 500);
  line (340, 0, 10, 500);
  line (380, 0, 10, 500);
  line (420, 0, 10, 500);
  line (460, 0, 10, 500);
  line (500, 0, 10, 500);


  popMatrix ();
  resetMatrix ();
}
