
//y = 1-x4
size (700,700);
background (136,165,139);

for (int x = 0; x < 700; x++) {
  float n = norm (x, 0.0, 700.0);
  float y = 1- pow (n, 4);
  y *= 700;
  point (x, y);
  strokeWeight (n * 5);
  stroke (x, y, x + y);
  line ( x *5, 0, x + 50, 700);
  
}


