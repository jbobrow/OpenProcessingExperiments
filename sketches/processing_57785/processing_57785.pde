
size (250, 250);
background (255);
 
for (int x=10; x<120; x+=20)
 
{
  stroke (234, 38, 38);
  line (125, x, x+130, 125);
  line (125, x+130, x, 125);
  line (125, -x+120, x, 125);
  line (x+130, 125, 125, 250-x);
}

