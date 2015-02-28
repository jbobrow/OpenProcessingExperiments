
size(500, 500);
background(0);
smooth();
noFill();



for (int x = 0; x < width; x+=50) {
  for (int y = 0; y < height; y+=50) {
    stroke (#F565E7,45);
    ellipse (255, 255, x, x+y);
    stroke (#D0EA0C,45);
    ellipse (255, 255, 500-x, height-y);
  }
}



