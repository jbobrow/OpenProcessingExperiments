
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
  stroke (255,102,0);
  fill (0);
  ellipse (250,y,100,100);
  line (200,250,250,y);
  line (300,250,250,y);
  line (0,0,250,y);
  line (250,y,500,0);
  y = y+10;

 


 
  
  
}

