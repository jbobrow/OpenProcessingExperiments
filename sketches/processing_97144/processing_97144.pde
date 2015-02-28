
size(200, 200);
background(255);

for (int x=5; x<200; x+=34) {
  for (int y=20; y<190; y+=35) {
    strokeWeight(3);
    stroke(0);
    line(x, y, x+4, y);
    line(y+5, x, y+5, x+4);
    if (x>=107 && x<=161 && y==125) {
      stroke(255, 0, 0);
      ellipse(x+20, y, 2, 2);
    }
    else {
      stroke(0);
      ellipse(x+20, y, 2, 2);
    }
  }
}



