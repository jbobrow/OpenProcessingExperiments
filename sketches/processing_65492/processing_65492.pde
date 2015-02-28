
void setup()
{
  size (683,384);
  smooth();
  background (5);
  noLoop();
   
  noFill();
  strokeWeight (0.5);
  stroke (255, 12);
}
 
void draw ()
{
  background (0);
   
  int d_dia = 200;
   
  for (int i = 0; i < 5000; i++)
  {
  strokeWeight (random (0.05, 1));
  float angle1 = random (TWO_PI), angle2 = random (TWO_PI);
  float dia = noise(angle1,angle2)*d_dia*2;
    PVector p1 = new PVector (width/2 + cos (angle1) * dia, height/2 + sin (angle1) * dia);
    PVector p2 = new PVector (width/2 + cos (angle2) * dia, height/2 + sin (angle2) * dia);
     
    line (p1.x, p1.y, p2.x, p2.y);
  }
}
 
void mousePressed ()
{
  saveFrame ("moon.jpg");
  redraw();
}

