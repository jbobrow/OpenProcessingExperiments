
size(400,400);
smooth();
background(255);
noFill();
stroke(240, 5, 255);

for(int i=10; i<width; i+=20)
{
  for(int j=10; j<height; j+=20)
  {
    arc(i+5, j+5, 10, 10, PI, PI*2);
    arc(i+5, j+5, 5, 5, PI, PI*2);
    arc(i+5, j+5, 15, 15, 0, PI);

    arc(i+5, j+5, 20, 20, PI, PI*2);
  }
}

