
size(500,500);
smooth();
background(255);

fill(0);
colorMode(RGB, 300);
for (int i = 0; i <= width; i=i+20) {
  for (int j = 0; j <= height; j=j+20) {
    for (int k = 0; k <= height+30; k=k+10) {
    stroke(i, j, 300);
    point(3*((i+k)/5),j);
    point(3*((i+k/10)/3), (j+k/5));
    }
  }
}


