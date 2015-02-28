
size(300, 300);
smooth();
background(0);
 
strokeWeight(12);
stroke(255); 
 
for (float y = 30; y <= height - 30; y = y + 30) {
  for (float x = 30; x <= width - 30; x = x + 30) {
    point(x,y);
  }
}


