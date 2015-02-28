
size (600, 600);
background (16,21,23);
smooth();
noFill();

for(int i=0; i<= width; i+=70)
{
  for(int j=20; j<= width; j+=70)
{
  stroke (255,i/4);
  noFill ();
  strokeWeight (i/100); 
  float x=2*i;
bezier(3*j, i*2, 40, 100/j, 220/x, 190,110+x, 160);
}
}


