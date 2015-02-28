
size(800,800);
background(0);
smooth();

fill(255);
noStroke();

for(int y=0; y<= height; y+=20)
{
  for(int x=0; x<= width; x+=20)
 {
  ellipse(x, y,  16-y/15, 16-y/15);
  }
}

