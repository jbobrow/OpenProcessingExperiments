
size (800, 800);
colorMode(RGB);
fill(231,201,118);
smooth();
background(255);
int b = 10;
int d = 40;

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
  strokeWeight(3);
  stroke(86, 62, 59);
  ellipse (a, b, b, b);
  for (int c=b;c<height;c=c+b) {
    ellipse(a, c, b, b);
  }
}



