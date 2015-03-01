
for (int x = 0; x < 100; x += 5) {
  float n = norm (x, 0.0, 100.0);
  float y = pow(n, 8);
  y *= 100;
  beginShape (TRIANGLE_FAN);
  vertex (x, y);
  vertex (x + 10, y +10);
  vertex (x-10, y - 10);
  endShape();
}



