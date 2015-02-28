
size (600, 600);
background (255);
smooth();
noFill();

for(int d=50; d<= width+width; d+=2*d)
{
  strokeWeight(4);
  stroke (0,228,255);
   ellipse(width/2+width/5,height/2-width/8, d,d);
   stroke(255,0,216);
   strokeWeight (1);
   ellipse(width/2+width/5,height/2-width/8, 1.2*d,1.2*d);
   stroke(0);
   strokeWeight(7);
   ellipse(width/2+width/5,height/2-width/8, 5*d,5*d);
}

for(int d=200; d<= width+width; d+=100)
{
  stroke (255);
  strokeWeight (60);
  ellipse (width/2+70, height/2+100, 2*d,2*d);
}


