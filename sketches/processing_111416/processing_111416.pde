
size(600, 600);
smooth();
background(255);

for (int x=0; x<600; x=x+10) {
  for (int y=0; y<600; y=y+10) {
    line(x, 0, x, 600);
    line(0, y, 600, y);
  }
}



