
// Marcos

size (200,200);
background (0);
for (int i=40; i<190; i=i+30)
{
  noStroke ();
  fill (190, 190, 295-i*i/94);
  ellipse (i, 50, 30, 30);
}
for (int x=-76; x<80; x=x+6) 
{
  noStroke ();
  fill (255,255,0);
  ellipse (x+100, (x*x/200)+80, 4, 4);
}
