
size(500, 500);
background(30);
smooth();
colorMode(HSB,100);
for (int x = 0; x < 1000; x++) {
  float r = random(x-PI);
  rotate(r);
  stroke(r,r-20,75);
  strokeWeight(5);
  point(x, (width/2));
}


