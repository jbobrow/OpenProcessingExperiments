
size (700, 700);
background (103);
smooth();
noFill();
 
for(int r=41; r<= width; r+=70)
{
  for(int e=10; e<= width; e+=10)
{
  stroke (132,r/4);
  fill (150,226,232);
  strokeWeight (r/15);
  float x=2*r;
bezier(10*e, r*28, 330, 53/e, 12/x, 321,130+x, 30);
bezier(90*e, r*43, 12, 53/e, 12/x, 234,89+x, 121);

}
}



