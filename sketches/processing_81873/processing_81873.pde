
size(800, 800); 
background(255);

stroke(0);
for (int y = 400; y> 0; y-= 10) {
  for (int x = 400; x> 0; x-= 5) {
    line(x*2, y*2, x, y);
  }
}


noFill();
stroke(255);
for (int x = 150; x < 800; x+= 10) {
  strokeWeight(x%0.2);
  ellipse(x, x, x*2, x*2);
}
