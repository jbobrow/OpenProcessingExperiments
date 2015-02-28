
//Draw a dense pattern by embedding two for structures.
//what does += mean?

for (int y = 20; y <= 85; y += 5) {
  for (int x = 20; x <= y; x += 5) {
    if (x <= 50) {
     line (x, y, x-3, y-3);
    } else {
      line(x, y, x-3, y-3);
    }
  }
} 

/*
fill(0, 76);
noStroke();
smooth();
for (int y = -10; y <= 100; y += 10) {
  for (int x = -10; x <= 100; x += 10) {
    ellipse(x + y/8.0, y + x/8.0, 15 + x/2, 10);
  }
} */


