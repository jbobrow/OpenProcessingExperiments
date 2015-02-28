
size(500, 500);
float space = 10;
smooth();

for (float x = 0; x < width; x= x + space) {
  for (float y = 0; y < width; y= y + space) {
    if (random(100) < 80) {
      stroke(0,0,255);
      line (x, y, x + space - 1, y + space - 1);
    }
    else {
      stroke(255, 0, 0);
      line(x + space - 1, y, x, y + space - 1);
    }
  }
}


