
size(300, 300);
smooth();
background(5, 5, 5);
noFill();
stroke(220, 145, 18); 

for (int x=0; x < width/20; x++) { //Sets up the first series of orange Ellipses
  for (int ellipseSize = 1000; ellipseSize>=10; ellipseSize-=50) {
    ellipse(x, x, ellipseSize, ellipseSize);
  }
}


stroke(100, 100, 100, 150);
rotate(radians(135));
for (int x=5; x < width/15; x++) {  //Sets up the second series of gray Ellipses
  for (int ellipseSize = 1000; ellipseSize>=10; ellipseSize-=50) {
    ellipse(x, x, ellipseSize, ellipseSize);
  }
}







