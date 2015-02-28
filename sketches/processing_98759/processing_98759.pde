
size(250,250);

// With a for loops
for (int x = 0; x < width; x+=10) {
  for (int y = 0; y < height; y+=10) {
    noStroke();
    fill(random(255));
    rect(x,y,10,10);
  }
} 

int x = 0;
while (x < width) {
  int y = 0;
  while (y < height) {
    noStroke();
    fill(random(255));
    rect(x,y,10,10);
    y += 10;
  }
  x += 10;
}


