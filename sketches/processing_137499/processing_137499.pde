
//y = 1-x4
size (700,700);
background (136,165,139);

for (int x = 0; x < 700; x++) {
  float n = norm (x, 0.0, 700.0);
  float y = 1- pow (n, 4);
  y *= 700;
  point (x, y);
  strokeWeight (n * 2);
  stroke (x, y, x + y);
  line ( x * 2, 0, x + 50, 700);
  strokeWeight (n * 1);
 stroke (x - 100, y + 15, x + y);
   line (0, y , 700, y * 5);

  
}


