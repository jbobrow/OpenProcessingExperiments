
size(500, 500);

int i =0;
while ( i <= 500 ) {
  int j = 0;
  while (j<=500) {
    int k = 0;
  while (k<=500) {
    fill(i, 100, 255, 10);
    rect(j, i, 100, 100);
    fill(100, j, 100, 10);
    rect(j, i, 100, 100);
    ellipse(k,j,5,5);
    k = k +10;
  }
    j = j + 10;
  }
  i = i + 10;
}



