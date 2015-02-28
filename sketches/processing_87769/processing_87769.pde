
size(800, 800);
smooth();
background(255);
stroke(0);
strokeWeight(1);

//white lines
for (int y=0; y<height; y+=10) {
  for (int x=0; x<width; x+=20) {
    line(x, y, x-20, y-10);
  }
}

//red lines
stroke(249, 35, 21);
strokeWeight(1);
for (int y=0; y<height; y+=10) {
  for (int x=0; x<width; x+=10) {
    line(x+90, y+90, x+10, y+10);
  }
}



