
int radius = 20;

  size (800, 800);
  smooth();
  strokeCap(ROUND);

  int start = 0;
  int ctr = 0;
  for (int x = 0; x < 800; x +=radius) {
    fill(start); 
    for (int y = 0; y < 20; y++) {
      if (y*radius < 255) {
        fill(y*radius);
      } 
      else {
        fill( y*radius - 255);
      } 
      rect(x + y*radius, x, radius, radius);
      rect(x - y*radius, x, radius, radius);
    }
  }


