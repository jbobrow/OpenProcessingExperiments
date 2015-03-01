
//loops
//pattern06

size(200, 200);
for (int x =0; x<width; x++)
  for (int y = 0; y<height; y++) {
    rectMode(CENTER);
    if (y%2==0)continue;
    if (x%2==0)
      rect(x*10, y*10, 10, 10);
    else
      rect(x*10, y*10, 4, 10);
  }



