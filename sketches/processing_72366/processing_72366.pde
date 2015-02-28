
size(500, 500); 
background(250);


int center = 25;

for (int x = center; x <=width - center; x += center) {
  for (int y = center; y <=height - center/2; y += center) {
    float r = random (0, 150);
    float g = random (150, 255);
    float b = random (50, 200);
    fill (r, g, b, 100);
    ellipse (x, y, 50, 50);
  }
}
