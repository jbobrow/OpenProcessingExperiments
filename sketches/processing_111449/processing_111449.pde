

size(400,400);

// With a for loops
for (int x = 0; x < width; x+=10) {
  for (int y = 0; y < height; y+=10) {
    stroke(0);
    fill(random(255));
   triangle ( x,y, x+10, y+30, x+20, y+50);
  }
  
} 





