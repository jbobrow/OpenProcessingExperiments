
size(800, 800);
background(160, 247, 94, 30);


for (int x=10; x<width; x+=10) {
  for (int y=10; y<width; y+=10) {
    stroke(160, 247, 94);
    strokeWeight(1);
    fill(245, 29, 119, 10);
    rect (x, y, width/2, height/2);
    rotate(5);
  }
}

