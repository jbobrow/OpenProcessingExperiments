
int i = 0;
int j = 0;
int c = 0;
int o = 0;

size(500, 500);
background(255);
smooth();
noStroke();

while (i <500) {
  fill(i, c, o, 100);
  rect(i, 0, 500, 500);
  i= i+50;
  c= c+25;
  o= 0+50;
}

while (j <500) {
  fill(j, o, c, 100);
  rect(0, j, 500, 500);
  j= j+50;
  c= c+25;
  o= o+50;
}



