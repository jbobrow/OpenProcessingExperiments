
size (500, 500);

for (int x = 0; x < 500; x++) {
  float n = norm (x, 0, 500);
  float y = pow ((1-n), 4);
  y *= 500;
  point (x, y);
}




