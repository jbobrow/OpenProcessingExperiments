
void setup ()
{
  size (2000, 200);
  smooth();
  background (214,241,175);
}
 
void draw ()
{
  float p = random (width);
  float f = random (height);
  float c = random (10,50);
   
  stroke(0);
  strokeWeight (1);
   
  float ksh = random (width);
   
  if(p < ksh)
  {
    fill (200,155,155);
    ellipse (p, f, c, c);
  }
  else
  {
    fill (222,156,125);
    translate (p, f);
    rotate (random (TWO_PI));
    triangle (0, 0, 0, c, c, c);
  }
}
