
// Jennifer Lau
// Exercise: Rectangles #1

size (800, 800);
smooth ();
background (0);



for (int y = 0; y < height; y += 15) {
  for (int x= 0; x < width; x +=15) {
    rotate (7);
    fill (random (255));
    rect (x+20, y+20,50, 50);
  }
}



