


size (100, 100);

for (int x = 0; x <100; x++) {
  float n = norm (x, 0, 100);
  float m = pow (n, 4);
  float y = 1-m;
  y *=100;
  point(x, y);
}




