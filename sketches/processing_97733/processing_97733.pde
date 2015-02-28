
// Rafael - Reforço 4 modificado

size (200,200);
background (0);
  
  for (int y=10; y<200; y=y+15)
{
  noStroke ();
  fill (174, 25, 295-y*y);
  ellipse (y, y, 20, 20);
    }
    for (int i =-125; i<60; i=i+10)
    {
  noStroke ();
  fill (255,0,255);
  ellipse (i+100, i+80, 4, 4);
}
