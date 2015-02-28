
size(200, 200);
background(255);
for (int x=10; x<200; x=x+35) {
  for (int y=10; y<200; y=y+35) {
    strokeWeight(1);
    fill(255,0,0);
    ellipse(x, y, 10, 10);
  }
}
for (int x=10; x<200; x=x+35) {
  for (int y=10; y<200; y=y+35) {
    strokeWeight(2);
    line(x+10,y,x+25,y);
    line(y+1, x+9, y+1, x+25);
  }
}
fill(0,255,0);
ellipse(10,10,10,10);
ellipse(45,10,10,10);
