
size (1000, 800);
background(255);
colorMode(HSB, 360, 100, 100);
for (int x = width - 25; x > 0; x = x - 50) {
  for (int y = height - 25; y > 0; y = y - 50) {
    if ((x == 725) || (y == 475)) {
      fill(0);
    }
    else {
      color rcolor = color(random(360), 50, 90);
        fill(rcolor);
    }
    ellipse(x, y, 30, 30);
  }
}
