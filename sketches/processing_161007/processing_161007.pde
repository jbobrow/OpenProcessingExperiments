
for (int x = 0; x < 100; x++) {
  float n = norm (x, 0.0, 100.0);
  float a = n * 255;
  stroke (a);
  line (x, 0, x, 25);
  float b = pow (n, 6) * 255;
  stroke (b);
  line (x, 25, x, 50);
  float c = pow (n, 7) * 255;
  stroke (c);
  line (x, 50, x, 100);
  float d = pow (n, 5) * 255;
  line (x, 100, x, 50);
}





