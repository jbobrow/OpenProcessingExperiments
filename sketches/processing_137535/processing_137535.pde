
for (int x = 0; x < 100; x++) {
  float n = norm(x, 0.0, 100.0);
  float y = pow(n, 8) + .6;
  y *= 100;
  point(x, y);
}
for (int a = 0; a < 100; a++) {
  float t = norm(a, 0.0, 100.0);
  float b = -pow(t, 8) + .4;
  b *= 100;
  point(a, b);
}
noFill ();
ellipse(10, 50, 21, 21);
ellipse(80, 30, 30, 30);
ellipse(80, 70, 30, 30);


