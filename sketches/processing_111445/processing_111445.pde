

size(400,400);

// With a for loops
for (int x = 0; x < width; x+=20) {
  for (int y = 0; y < height; y+=40) {
    stroke(0);
    fill(255);
    rect(x,y,x+6,y+6);
  }
} 




