
size (600, 600);
background (255);

int i = 0;
while ( i <= 600 ) {
  int j = 0;
  while ( j <= 600 ) {
    noStroke();
    fill(i, 0, 0);
    ellipse(j, i, 5, 5);      
    j = j + 8;
  }
  i = i + 8;
}



