
size (500, 500);
background(15, 80, 165);

for (int x = 0; x < 500; x++) {
  float n = norm (x, 0, 520);
  float y = pow (n, 8);
  y *= 500;
  ellipseMode(CORNER);
  noStroke();
  float val = n*255.0;
  fill(val);
  ellipse(x, y, x, y);
}

for (int x = 0; x < 500; x+= 15) {
  float n = norm (x, 0, 500);
  float y = pow (n, 8);
  y *= 500;
  ellipseMode(CENTER);
  float val = n*255.0;
  stroke(123, 25, 134);
  strokeWeight(2*n);
  noFill();
  ellipse(x, y, 200, 200);
}

for (int x = 0; x < 500; x+= 15) {
  float n = norm (x, 0, 500);
  float y = pow (n, 8);
  y *= 500;
  ellipseMode(CENTER);
  float val = n*255.0;
  stroke(23, 225, 34);
  strokeWeight(2*(1-n));
  noFill();
  ellipse(x, y, 200, 200);
}




