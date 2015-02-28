
size(500,500);
smooth();
background(255);

fill(0);
colorMode(HSB, 500);
for (int i = 10; i <= width; i=i+30) {
  for (int j = 0; j <= height; j=j+2) {
    stroke(i, j, 500);
    point(i, j);
    point(i+100, j+10);
  }
}


