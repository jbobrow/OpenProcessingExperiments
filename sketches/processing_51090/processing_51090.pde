
size (1200, 800);
noFill();
smooth();
background(220, 250, 255);

for (int a=1; a<=width; a=a+3) {

  strokeWeight(2);
  stroke(220, 0, 100);
  for (int b=1/2;b<height;b=b+6) {
    //    point(a, b/250);
    strokeWeight(a/5);
    point(a*9, b);
  }
}


