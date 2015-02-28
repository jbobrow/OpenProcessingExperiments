
size(800, 800);
background(255);
smooth();

for (int y = 0; y <= width; y += 20) {
  for (int x = 0; x <= height; x += 20) {
    stroke(212, 212, 0);
    line(height/2, width/2, x, y);
  }
}


