

size(500, 250);
background(0);
smooth();
 color c = color(random(255),random(255),random(255));
    fill(c);

stroke(250);
for (int y = 20; y <= height-20; y += 10) {
  for (int x = 20; x <= width-20; x += 10) {
    ellipse(x, y, 8, 8);
    
    line(x, y, 250, 100);
  }
}


