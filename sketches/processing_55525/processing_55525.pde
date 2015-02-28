
size (250,250);
background (215);
smooth ();
int x = 10;
for (x=10;x<120;x+=20)
{
  line (85, x, x+130,105);
  line (85, x+130,x,105);
  line (85, 120-x,x,105);
  line (85, 250-x,x+130,105);
}
