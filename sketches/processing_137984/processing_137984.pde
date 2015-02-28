

size(500, 500);
background(255);
smooth();
noStroke();

int i = 0;
while (i <= 500) {
  
  int j = 0;
  while (j <= 500) {
    fill(j/2, i/2, 50, j/2);
    rect(i, j, 10, 10);

//dots
    int k =0;
    while (k<=5) {
      fill(0);
      rect(i + k*2, j+ k*2, 1, 1);
      k= k+1;
    }
    j= j+16;
  }
  i=i+16;
}

