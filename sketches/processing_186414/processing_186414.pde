
size(400,400);
background(0);
//black background

stroke(0,255,0);
//green outline for future shapes

//for loop within a for loop creating circle pattern
for (int a = 20; a <= height; a+=25) {
  for(int b = 10; b<= width; b+=10) {
  ellipse(a+b, b, 12-b/10.0, 12-b/10.0);
  }
}


