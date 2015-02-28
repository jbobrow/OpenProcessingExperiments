
size (200, 200);
background (0,0,255);
for (int i=40; i<180; i=i+40) {
  for (int j=40;j<170;j=j+35) {
    if (j>130&&j<150 && i>90&&i<150) {
      fill (255,0,0);
    }
    else {
      fill(255,255,0);
    }
    noStroke();
    ellipse (i, j, 10, 10);
    stroke(255,255,0);
 
    if (j<145) {
      line (i, j+12, i, j+25);
    }
    if (i<145) {
      line (i+12, j, i+25, j);
    }
  }
}
