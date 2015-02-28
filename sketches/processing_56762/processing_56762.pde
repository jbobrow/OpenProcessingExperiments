
size (400,400);
smooth ();
strokeWeight (2);

for (int y = 0; y <= height; y += 40) {
  for (int x = 0; x <= width; x += 40) { 
    fill(255, 140);
    ellipse (x,y,50,50);
  }
}




