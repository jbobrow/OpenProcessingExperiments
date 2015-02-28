
size(800,800);
smooth();

for(int x= 0; x< width; x+=50)
{
  for(int y=0; y<height; y+=50)
  {
    stroke (0,147,242);
    strokeWeight(10);
    fill(47,147,211);
    rect(x,y,200,200);
  }
}

