
//setup
size(600, 600);
smooth();
background(0);
colorMode(HSB, 600);

//squares that grow and move diagonally
for (int x = 0; x < width; x = x+15) {
  for (int y = 0; y < height; y = y+15) {
    fill(x, x, x);
    strokeWeight(.5);
    rect(x, x+5, x, y);
    
    //circles going diagonally across
    if (x>y) {
      fill(450, x, width);
      ellipse(x, y, 10, 10);
    }
  }
}


