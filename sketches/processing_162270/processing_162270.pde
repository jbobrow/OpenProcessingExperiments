
size (300, 300);
colorMode (RGB);
background (219, 245, 195);
smooth ();
float s = 0.0;
float inc = .5;
noStroke ();
fill (71, 116, 29, 300);
noiseSeed (0);
for (int i = 0; i < width; i += 5) {
  float n = noise (s) * 300;
  ellipse (i, 50 +n, noise (s), 250);
  s = s + inc;
  
}



