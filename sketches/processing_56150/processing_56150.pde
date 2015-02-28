
size (300, 300);
background (255);
smooth ();
fill (155, 204, 83);
stroke (0, 204, 83, 150);
for (int y = 20; y<= height-20; y += 10) {
  for (int x = 20; x<= width-20; x +=10) {
    float redcol = map (x, 20, 280, 0, 255);
    fill (x, y, 125); // will go through the colour gradient based on x + y coordinates
    rect (x, y, 5, 5);
    stroke (x, y, 125);
    line (x, y, 250, 200);
  }
}

