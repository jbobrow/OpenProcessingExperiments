
size(800,800);
background(0);
smooth();

noFill();
stroke(255);

for(int y=0; y<= height; y+=100)
{
  for(int x=0; x<= width; x+=20)
 {
  line(x, y, width/2, height/2);
  }
}

