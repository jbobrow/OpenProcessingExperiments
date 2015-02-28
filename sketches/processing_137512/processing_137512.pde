
/* Douglas Tran March 02 Creative Computing Rory Solomon */

size (500, 500);
smooth();
strokeWeight(3);
background(255, 255, 0);

int a = 0;
int b = 0;
int c = 0;
int d = 0;

while ( a <= 500 ) {
  line(a, 0, 500, 500);
  a = a + 50;
}

while ( b <= 500 ) {
  line(0, b, 500, 500);
  b = b + 50;
}

while ( c <= 500 ) {
  line(0, 0, c, 500);
  c = c + 50;
}

while ( d <= 500 ) {
  line(0, 0, 500, d);
  d = d + 50;
}



