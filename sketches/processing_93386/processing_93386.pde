
size(200,200);
background(255);
noStroke();
colorMode(RGB, 200);
for (int i = 0; i < 200; i++) {
  for (int j = 0; j < 200; j++) {
    stroke(i*i/100, j*j/150, 50);
    point(i, j);
  }
}
int k = 3;
strokeWeight (10);
while(k < 200){
  point (k, k*k/200);
  k = k + 13;
}
