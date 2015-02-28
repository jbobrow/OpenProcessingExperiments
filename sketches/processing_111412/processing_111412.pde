
size(600, 600);
smooth();
background(255);

for (int x = 0; x <= width * 4 ; x = x+30) {
  for (int y = 0; y<= height * 4; y = y+30) {
    ellipse(x, y, x, y);
    ellipse(x, y, x + y, x + y);
  }
}



