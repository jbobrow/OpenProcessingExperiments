
size(300, 300);
// squares from top-left to bottom-right
for (int y=35; y<=250; y+=25) {
  noStroke();
  rectMode(CENTER);
  rect(y, y, 50, 50);
  rectMode(CORNER);
  fill(255, 0, 0);
  rect(y, y, 50, 50);
}
// circles top and bottom  
for (int x=35; x<=250; x+=205) {
  ellipseMode(CENTER);
  ellipse(150, x, 50, 50);
  ellipseMode(CORNER);
  fill(0, 126, 255);
  ellipse(150, x, 50, 50);
}


