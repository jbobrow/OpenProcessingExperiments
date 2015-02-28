
size (600, 600);
background (220,241,253);
smooth();
noFill();

for(int i=0; i<= width; i+=40)
{
  for(int j=-0; j<= width; j+=30)
{
  stroke (255,i/8);
  noFill ();
  strokeWeight (.2+i); 
  float x=2*i;
  beginShape();
vertex(1.1*j,1.1*i);
vertex(100+j,0+i);
vertex(150+2.5*j,20+2.5*i);
vertex(120+2*j,40+2*i);
vertex(70+.9*j,30+.9*i);
vertex(1.1*j,1.1*i);
endShape();
}
}
for(int i=0; i<= width; i+=60)
{
  for(int j=0; j<= width; j+=30)
{
  stroke (0,i/4);
  fill (0, i,j, i);
  strokeWeight (2); 
  float x=2*i;
  beginShape();
vertex(1.1*j,1.1*i);
vertex(100+j,0+i);
vertex(150+2.5*j,20+2.5*i);
vertex(120+2*j,40+2*i);
vertex(70+.9*j,30+.9*i);
vertex(1.1*j,1.1*i);
endShape();
}
}

