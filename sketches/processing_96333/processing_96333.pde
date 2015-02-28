
size (200, 200);
background (0);
int x=0;
strokeWeight (5);
while (x<=200) {
  stroke (100,0,0);
  point (x, (x*x/200));
  x=x+10;
}
