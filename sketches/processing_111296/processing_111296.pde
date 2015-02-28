
size (800, 800);
colorMode(RGB);
fill(222, 199, 209);
smooth();
background(255);
int b = 10;
int d = 45;

for (int a=b/15; a<=width; a=a+b)
{
  strokeWeight(3);
  stroke(234, 194, 182);
  ellipse (a, b, b, b);
  for (int c=b;c<height;c=c+b) {
    ellipse(a, c, b, b);
  }
}

for (int a=d/8; a<=width; a=a+d)
{
  strokeWeight(2.5);
  stroke(57, 99, 219);
  ellipse (a, b, b, b);
  for (int c=b;c<height;c=c+b) {
    ellipse(a, c, b, b);
  }
}



