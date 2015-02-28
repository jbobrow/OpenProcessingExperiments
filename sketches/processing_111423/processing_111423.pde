

size(400,400);

// With a for loops
for (int x = 0; x < width; x+=100) {
  for (int y = 0; y < height; y+=100) {
    stroke(0);
    fill(random(255));
   triangle ( x,y, x+50, y+50, x+20, y+50);
  }
  
} 





