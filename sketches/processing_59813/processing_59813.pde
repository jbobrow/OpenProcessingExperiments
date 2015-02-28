
size (200,200);
background (0,0,139);
int i = 40;
stroke (135,206,235);
noFill();
smooth();
strokeWeight(5);
{
if (i < 50)
{
  ellipse (40,40,i,i);
  ellipse (90,20, i, i);
  ellipse (170, 120, i, i);
  ellipse (100, 100, i, i);
  ellipse (30,150, i, i);
  ellipse (100, 170,i,i);
}
else {
  line (0,0,200,200);
  line (0,200,200,0);
}
}
 

