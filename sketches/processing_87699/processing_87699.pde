
size(700, 700);
smooth();

for (int x= 0; x< width; x+=10)
{
  for (int y=0; y<height; y+=20)
  {
    stroke (0);
    strokeWeight(5);
    fill(148, 198, 203);
    rect(x, y, 32, 456);
  }
}

fill(174, 233, 218);
strokeWeight(3);
for (int i = 21; i <= 98; i += 67) {
  rect(i + i/2, i, i*10.2, i/3);
}

fill(174, 233, 218);
strokeWeight(1);
for (int i =29; i >= 123; i += 98) {
  rect(i + i/3, i, i*2.7, i/2);
}



