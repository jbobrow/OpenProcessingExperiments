


size(500, 500);
smooth();
background(0);
strokeWeight(1);





stroke(0, 176, 227, 30);
for (int x = 0; x < width; x+=20) {
  for (int y = 0; y < height; y+=20) {
    line (x, x, y, y/5);
    //line (x+10, x+10, y, y/2);
    line (width-x, width-x,width-y, width-y/5);
  }
}



