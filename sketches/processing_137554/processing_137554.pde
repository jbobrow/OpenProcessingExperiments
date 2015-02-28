
int i = 0;

size(500, 500);
background(255);
smooth();
noStroke();


while (i <= 500) {
  int j = 0;
  while (j <= 500) {
    fill(j/2, i/2, 100, j/2);
    rect(i, j, 10, 10);
    j= j+5;
  }
  i=i+5;
}



