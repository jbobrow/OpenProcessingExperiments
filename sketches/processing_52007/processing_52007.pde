
size (800, 800);
noFill();
smooth();
background(0);

for (int a=1; a<=width; a=a+13){

  strokeWeight(2);
  stroke(200,202,50);
  for (int b=1;b<height;b=b+13) {
    point(a,b);
  }
}                
                
