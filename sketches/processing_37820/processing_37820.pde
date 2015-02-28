
size(500, 500);
rectMode(CENTER);
colorMode (RGB, width);
smooth();

noFill();

for (int y = 0; y< height; y ++) {
  for (int x = 0; x < width; x++) {
    stroke (x, y, y);
    point (x, y);
  }
}

for (int x = 0; x<width; x+=50) {
  for (int y = 0; y< height; y+=50) {
    for (int circle = 5; circle <= 70; circle +=5) {
      stroke(0);
      ellipse (x+25, y+25, circle, circle);
    }
  }
}



