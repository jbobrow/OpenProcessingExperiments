
int size = 50;

smooth();
size(500, 500);
colorMode(HSB, 360, 100, 100, 100);
background(0);

for (int x = 0; x <= width; x += size/2) {
  int colorValueX = int(map(x, 0, width, 0, 180));

  for (int y = 0; y <= height; y += size/2) {
    int colorValueY = int(map(y, 0, width, 0, 180));

    fill(colorValueX + colorValueY, 80, 80, 80);
    ellipse(x, y, size, size);
  }
}


