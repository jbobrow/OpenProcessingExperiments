
size(400, 400);
background(0);

for(int x = 600; x > 0; x -= 20) {
  for(int y = 0; y <= width; y += 20) {
    
    stroke(y * 1.3);
    strokeWeight((3 * y) / (x * 2));
    noFill();
    //line(0, y, width, y);
    ellipse(y * 2, y * 2, x, x);
  }
}



