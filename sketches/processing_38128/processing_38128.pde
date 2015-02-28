
size(440, 390);
colorMode(RGB, height);
smooth();
background(0);


//Ellipses and colors
//Grid and random fills of ellipses
for ( int countX = 0; countX <= 20; countX ++) {
  for ( int countY = 0; countY < 20; countY++) {
    for ( int ellipseSize = 10; ellipseSize >= 5; ellipseSize -= 3) {
      ellipse(20 + (countX * 20), 15 + (countY *20), ellipseSize, ellipseSize);
      stroke(RGB, width, height);
      fill(random(width), 0, 200);
    }
  }
}


