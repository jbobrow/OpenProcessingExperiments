
size (800, 800);
noFill();
smooth();
background(120,00,10);

for (int a=1; a<=width; a=a+3) {

  strokeWeight(2);
  stroke(100, 255, 150);
  for (int b=1/2;b<height;b=b+8) {
    point(a, b);
    strokeWeight(b/100);
    point(a*100/20,b);
//    for (int c=a+2; c<width; c=c+1) {
//      point(a,c);
//    }
  }
}
                
