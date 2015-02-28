
//pattern: line02

size (500, 500);
background (0);
strokeWeight (2);
stroke (33, 120, 162, 20);
smooth ();


for (int x= 0; x<width; x+=20) {
  for (int y=0; y<height; y+=20) {
    line (0, x, 500, y);
  }
}



