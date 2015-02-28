


size (480, 120);
background (0);
smooth();
fill (255);
stroke (102);

for (int y = 20; y <= height -10; y += 15 ) {
  for (int x = 20; x <= width -10; x += 15) {

    line(x, y, 240, 60);
    ellipse (x, y, 5, 5);


    //draw a to the center of the display
  }
}



