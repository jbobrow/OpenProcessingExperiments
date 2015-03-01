
size (200, 200);
for (int x = 180; x >= 0; x -= 10) {
  for (int y = 10; y <= 100; y += 10) {
    if (x >= 90) {
      line (x, y, 190, y +10);
      } else  {
      point (x, y);
      }
  }
}
  




