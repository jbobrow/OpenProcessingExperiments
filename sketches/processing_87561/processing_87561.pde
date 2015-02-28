
size(500, 500);

for (int i=10; i<=500; i+=10) {
  for (int x=10; x<=500; x+=10) {
    rect(i, x, 20, 500);
    triangle(i, x, width-i*2, height-x*2, 250, 250);
  }
}



