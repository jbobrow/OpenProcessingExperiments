
size (900, 800);
noFill();
smooth();
background(250, 0, 0);

for (int a=1; a<=width; a=a+8) {

  strokeWeight(2);
  stroke(0, 250, 200, 95);
  for (int b=1;b<height;b=b+8) {
    //    point(a, b/250);
    strokeWeight(a/900);
    line(a, b, a*150, b*100);
  }
}
          
                                
