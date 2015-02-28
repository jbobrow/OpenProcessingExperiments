
size (200, 200);
background (255);
int k=-100;
while (k<=100) {
  stroke(123,232,123);
  point (k+100, (k*k/100)+100);
  point ((k*k/100)+100, k+100);
  point (-k+100, -(k*k/100)+100);
  point (-(k*k/100)+100, -k+100);
  
  point ((k*k/100)+100, k+100);
  point (k+100, (k*k/100)+100);
  point ( -(k*k/100)+100, -k+100);
  point (-k+100, -(k*k/100)+100);
  k=(k+2);
}
