
size (200, 200);

int x = 0;
while (x < width) {
  int y = 0;
  while (y < height) {
    noStroke();
    fill(random(255), random(255), random(255));
    rect(x, y, 10, 10);
    y += 10;
  }
  x += 10;
}

