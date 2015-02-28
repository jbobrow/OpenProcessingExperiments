
size (400, 400);
background(255);
float x = 0.0;
float inc = 0.05;
noiseSeed(0);
noFill();
stroke(5);
for (int i = 0; i <= width; i+=2) {
  float n = noise (x) * 100;
  triangle (i, n, i-n, i+n, i+n, n-i);
  x += inc;
}
