
/*
size (300, 300);
background (255);
stroke (0);
noFill();

D

for (int i = 0; i < 10; i++) {
  rect(i*20, height/2, 5, 5);
}

A

int i = 0;
while (i < 10) {
  ellipse (width/2, height/2, i*10, i*20);
  i++;
}

B

for (float i = 1.0; i < width; i *= 1.1) { 
  rect(0, i, i, i*2);
}

C

int x = 0;
for (int c = 255; c > 0; c -= 15) {
  fill (c);
  rect (x, height/2, 10, 10);
  x = x + 10;
}

*/

