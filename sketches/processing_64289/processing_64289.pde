
size (200,200);
background (255);

smooth();

for (int x = 0; x < 200; x = x+15) {
  for (int y = 0; y < 200; y = y+15) {
    colorMode(RGB, 100);
    
strokeWeight (1);
colorMode(RGB, 100);
stroke(0, 0, 255); 
triangle(x, y, 40, 50,70, 90);
  }
}

