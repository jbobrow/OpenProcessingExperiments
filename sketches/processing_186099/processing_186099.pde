
//loops
//pattern04

size(200, 200);
for (int x =0; x<width; x++)
  for (int y = 0; y<height; y++) {
    if (x%2==0)continue;
    rect(x*10, y*10, 8, 8);
  }



