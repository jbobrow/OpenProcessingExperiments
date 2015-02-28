
size(500,500);
smooth();
fill(240, 20);
for (int x = 0; x < width; x+=15) {
  for (int y = 0; y < width; y+=15) {
    rect(x, x+5, x +y, x*y);
    bezier(x, y, x*10, y/5, height/2, width/2, height/6, width);
    bezier(x/3, y, x/4, y/10, height/2, width/2, height/6, width/15);
    bezier(0, 0, x/4, y*3, height*7, width, height*2, width/15);
    bezier(500, 500, x/4, y*3, height*7, width, height*2, width/15);
  }
}

//saveFrame("comp1.png");

