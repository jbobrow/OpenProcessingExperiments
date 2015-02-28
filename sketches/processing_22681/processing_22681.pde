
int y = 250; 
int x = 250;
void setup()
{
  size (500, 500);
  background(0, 0, 0);
  strokeWeight (1);
  smooth ();
}
void draw ()
{
  stroke (255);
  line (0,500,250,y);
  line (250,y,500,500);
  stroke (3,252,12);
  line (0, 0, 250, y);
  line (250, y, 500, 0);
  y = y+10;
  
  
}


