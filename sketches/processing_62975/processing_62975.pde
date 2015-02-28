
//Ellipses or Arcs - pattern01

size(500,500);
background(0);
smooth();
 
fill(246,255,0);
noStroke();
 
for(int y=0; y<= height; y+=10)
{
  for(int x=0; x<= width; x+=20)
 {
  ellipse(x, y,  6-y/95, 6-y/95);
  }
}


