

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
    
    stroke(0);
    fill(j, i, 50, j/2);
    ellipse(i+24, j+24, 40, 40);

    j= j+16;
  }
  i=i+16;
}


