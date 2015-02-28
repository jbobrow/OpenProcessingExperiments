
background(#0027BF);
size(600, 600);
smooth();


noFill();
stroke(255);
for (int d = 1000; d > 0; d -=10){
  ellipse (300, 300, d, d);
}
//circle radius


strokeWeight(5);
stroke(#F00000);
for (int x=10; x<600; x+=10) {
 for (int y=10; y<600; y+=10) {
    point(x, y);
  }
}
//small dots


strokeWeight(1.5);
stroke(#00FF46);
for(int y =10; y<=600; y+=10) {
  for (int x= 10; x<=600; x +=10) {
    if ((x % 10) == 0) {
      line (x, y, x+3, y-3);
    } else {
      line (x,y, x+3, y+3);
    }
  }
}
//green strokes



stroke(255);
strokeWeight(10);
rect(0,0,600,600);
noFill();
