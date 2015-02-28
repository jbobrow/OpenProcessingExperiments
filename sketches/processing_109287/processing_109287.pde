
size(1200, 900);
smooth();
colorMode(HSB, 360, 100, 100);
background(0, 0, 100);

for (int i = 10; i < width; i += 50) {
  for (int j = 10; j < height; j += 50) { 
    noStroke();
    fill(random(0, 355), 100, 100);
    ellipse(i, j, 13, 13);
    //}
  }
}

for (int a = 10; a < width; a += 50) {
  fill(0,100,0);
  ellipse(a, 510, 13, 13);
}
for (int b = 10; b < height; b += 50) {
  fill(0,100,0);
  ellipse(710, b, 13, 13);
}
