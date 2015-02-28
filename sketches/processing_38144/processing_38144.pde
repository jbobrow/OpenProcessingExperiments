
size(300, 300);
for (int s=0;s<width;s++) {//sets up s value for fill color
  for (int r=0;r<200;r++) {//fill plus square
    fill (width/2, r, s);
    float ellipsesize = random(50);
    float ellipselocW = random(width);
    float ellipselocH = random(height);
    rectMode(CORNER);
    rect(ellipselocW, ellipselocH, ellipsesize, ellipsesize);
  }
}


