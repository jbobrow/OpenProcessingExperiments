


size (500, 500);

for (int x = 0; x <500; x++) {
  float n = norm (x, 0, 500);
  float val = n*255;
  stroke(val);
  line (x, 200, x,300);
  
  
}



