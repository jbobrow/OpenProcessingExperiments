
size(256, 256);

for (int y = 0; y < height; ++y) {
  for (int x = 0; x < width; ++x) {
    color c = color(x, y, 0);
    set(x, y, c);
  }
}
