
/* Douglas Tran March 02 Creative Computing Rory Solomon */

size (480, 700);
smooth();
strokeWeight(25);
background(#ACC4B0);

int a = 0;
int b = 0;
int c=10;


while ( a <= 500 ) {
  line(a, 0, 100, 500);
  a = a + 50;
}

strokeWeight(23);
//fill(#F4EBF5); change color of line?
while ( b <= 500 ) {
  line(0, b, 500, 500);
  b = b + 50;
  
}

strokeWeight(4);
fill (#635664);
while (c <=700) {
  line(3,c,100,30);
  c = c+10;
}





