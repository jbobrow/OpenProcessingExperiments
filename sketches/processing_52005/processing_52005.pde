
size (1200, 800);
noFill();
smooth();
background(220, 250, 255);

for (int a=1; a<=width; a=a+8) {

  strokeWeight(2);
  stroke(220, 0, 100, 50);
  for (int b=1;b<height;b=b+8) {
    //    point(a, b/250);
    strokeWeight(1);
    line(a, b, a*2, b*100);
  }
}
                
                
