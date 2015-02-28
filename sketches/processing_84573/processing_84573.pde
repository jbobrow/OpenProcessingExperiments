
for (int x=0; x <100; x++) {
  float n = norm (x, 0.0, 100.0);
  float y= pow(n, 0.25);
  float g= n * 255.0;
  noFill();
  stroke (g);
  line (x, 0, x, 100);
  ellipse (50, 100, x, x);
  
  fill(g, 30);
  noStroke();
  ellipse (x, y, 100, 100);
}
