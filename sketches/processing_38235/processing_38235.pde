
size(300, 300);
colorMode(RGB, width);
smooth();


 
 

//Grid and randomly coloured ellipses
for ( int countX = 0; countX <= 30; countX ++) {
  for ( int countY = 0; countY < 30; countY++) {
    for ( int ellipseSize = 60; ellipseSize >= 20; ellipseSize -= 10) {
      stroke(RGB, width, height);
      fill(random(width), random(width), 600);
      ellipse(10 + (countX * 10), 10 + (countY *10), ellipseSize, ellipseSize);
     
    }
  }
}


