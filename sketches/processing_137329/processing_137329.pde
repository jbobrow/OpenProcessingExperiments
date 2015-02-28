
size (500,500);
background(0);
for (int x= 0; x < 500; x++) {
  float n = norm(x, 0.0, 500.0);
  float y = pow (n, 8);
  y *= 500;
  noFill();
  stroke(x, y, 0);
  line (x, y, x*3 ,2*y);
  float gradient = pow(n, 8)*255.0;
  //stroke(255-x);
  line (x, y, 0, 500);
}


