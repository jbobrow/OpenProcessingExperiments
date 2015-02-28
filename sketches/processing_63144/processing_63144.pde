
size (600, 600);
background (0);
smooth();
noFill();
 
for(int d=10; d<= width+width; d+=0.1*d)
{
  stroke (220);
  strokeWeight (2); 
  ellipse(width/5,3*height/4, d,d);
}

for(int d=10; d<= width+width; d+=0.1*d)
{
  stroke (0);
  strokeWeight (4); 
  ellipse(width/5+10,3*height/4+15, 1.01*d,1.01*d);
}

