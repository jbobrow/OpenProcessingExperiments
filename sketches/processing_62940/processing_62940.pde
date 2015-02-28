

size(600, 600);
smooth();
background(0);
stroke(255);

for (int i = 10; i<width; i+=10) 
{
  for (int j = 9; j<height; j+=8) {
    stroke(j, 248, i*2);
    point(i*3,j);
    point(j,(i/2)+4);
    point(j+2,j+i);
    stroke(245, 9, 248);
    point(j+2,(i/2)+3);
    point(i/3, 12+j);
    point(i-6, 4+j);
  }
}

