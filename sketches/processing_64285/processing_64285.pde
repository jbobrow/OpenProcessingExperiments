
size (200,200);
background (255);
strokeWeight (5);
smooth();

for (int x = 0; x < 200; x = x+15) {
  for (int y = 0; y < 200; y = y+15) {
       point(x, y);
  }
}

