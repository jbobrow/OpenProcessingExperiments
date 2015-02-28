
size(480, 120);
background(120, 120, 250);

for (int y = 0; y <= height; y += 20) {
  
  for (int x = 0; x<= width; x+= 20) {
   fill(214, 13, 100);
   ellipse(x*2, y/2, 10, 10);
   strokeWeight(2);
   stroke(255);
   line(0, y+20, 480, y+20);
  }
}

