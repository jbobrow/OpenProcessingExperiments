
size (800, 800);
noFill();
smooth();
background(250, 250, 250);

for (int a=1; a<=width; a=a+8) {

  strokeWeight(2);
  stroke(150, 240, 20, 50);
  for (int b=1;b<height;b=b+8) {
    strokeWeight(a/400);
    if (a < 300) {
      line( b, a, width/8, height/8 );
    } 
    else {
      strokeWeight(a/800);
      stroke(250, 250, 50, 10);
      line( b, a, width/100, height/100 );
    }
  }
}                
                
