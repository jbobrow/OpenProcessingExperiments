
size(400, 400);
colorMode (RGB, 255);

for (int x=20; x<width; x+=20) {  //horrizontal lines
  stroke(255);
  line(x, 0, x, width);
}

for (int y=40; y<height; y+=40) {  //vertical lines
  stroke(255);
  line(0, y, height, y);
}

for (int r=20; r<width; r+=20) {  //random rectangles
  noStroke();
  rect(r, random(height), width, 40);

  float rndColor;                  //random color setup
  rndColor = random(100);
  fill(rndColor);

  if (rndColor > 40) {              
    fill (0);
  }
  else {
    fill (40, 140, 190);
  }
  if (rndColor < 30) {
    fill (255, 0, 0);
  }
  else {
    fill (0);
  }
}


