
size(500,500);
smooth();
fill(0, 20, 140, 10);
stroke (255, 100);
for (int x = 0; x < 500; x+=50) {
  for (int y = 0; y < 500; y+=50) {
    ellipse(x, x+5, x +y, x*y);
    bezier(x, y, x*10, y/5, height/2, width/2, height/6, width);
    bezier(x, y, x, y, height/2, width/2, height/6, width);
    bezier(x*y, x*y, x, y, height, width, height, width);

  }
}

//saveFrame("comp1.png");

