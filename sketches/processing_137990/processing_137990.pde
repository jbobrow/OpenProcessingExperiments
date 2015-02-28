
size(500, 500);
background(255, 255, 255);




int i = 0;

while (i < 10) {
  fill(3, 3, 3, 15);
  rect( 200, i*30, 15, 15);
  i= i+ 1;
  int m = 0;
  while (m < 10) {
    fill (0, 247, 233);
    ellipse (215, m*30, 5, 5);
    m= m+ 1;
  }
}



