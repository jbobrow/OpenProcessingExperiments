
size(500,500);
smooth();
background(0);

for (int a=0; a<=width; a=a+25) {
  for (int b=0; b<=height; b=b+25) {
    stroke(a,b,100);
    strokeWeight(1);
    line(width/2, height/2, a, b);
  }
}




