
size (200, 200);
background (0);
for (int i=40; i<190 ; i=i+30) {
  noStroke();
  fill(30, 50, 200, 295-i*i/94);
  ellipse (i, 50, 40, 40);
}

for (int x=-76; x<80 ; x=x+6) {
noStroke();
  fill(30, 50, 200);
  ellipse (x+100, (x*x/200)+115, 4, 4);
}
