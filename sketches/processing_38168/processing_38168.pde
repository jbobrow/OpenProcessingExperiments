
size(500, 500);
colorMode(RGB, width);
background(150);

for(int x = 0; x <= width; x += 15) {
  //grid in the x
  for(int y = 0; y <= width; y += 15) {
    //grid in the y
    stroke(x, y);
    fill(x);
    ellipse(x, y, 10, 10);
    //arranges ellipses in previously established grid
    ellipse(x, y, random(5, 15), random(5, 15));
    //draws additional ellipses with randomized dimensions
    smooth();
  }
}

